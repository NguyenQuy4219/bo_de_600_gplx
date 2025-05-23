import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/question.dart';

/// Trang hiển thị danh sách các câu hỏi đã trả lời sai
class IncorrectQuestionsPage extends StatefulWidget {
  const IncorrectQuestionsPage({Key? key}) : super(key: key);

  @override
  State<IncorrectQuestionsPage> createState() => _IncorrectQuestionsPageState();
}

class _IncorrectQuestionsPageState extends State<IncorrectQuestionsPage> {
  List<Question> incorrectQuestions = [];

  @override
  void initState() {
    super.initState();
    _loadIncorrectQuestions();
  }

  Future<void> _loadIncorrectQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('incorrect_questions') ?? [];
    final loadedQuestions = jsonList
        .map((q) => Question.fromJson(jsonDecode(q) as Map<String, dynamic>))
        .toList();

    setState(() {
      incorrectQuestions = loadedQuestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Câu trả lời sai')),
      body: incorrectQuestions.isEmpty
          ? const Center(
              child: Text(
                'Không có câu trả lời sai nào được lưu.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: incorrectQuestions.length,
              itemBuilder: (context, index) {
                final q = incorrectQuestions[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hiển thị số thứ tự và nội dung câu hỏi
                        Text(
                          'Câu ${q.indexNumber}: ${q.questionText}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        // Liệt kê các đáp án, đánh dấu đáp án đúng
                        ...List.generate(q.answers.length, (i) {
                          final isCorrect = i == q.correctAnswerIndex;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              '${String.fromCharCode(65 + i)}. ${q.answers[i]}'
                              '${isCorrect ? ' ✅' : ''}',
                              style: TextStyle(
                                color: isCorrect ? Colors.green : Colors.black,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
