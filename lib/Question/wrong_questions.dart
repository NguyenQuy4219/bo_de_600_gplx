import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/question.dart';

class IncorrectQuestionsPage extends StatefulWidget {
  const IncorrectQuestionsPage({super.key});

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
    final loadedQuestions =
        jsonList.map((q) => Question.fromJson(jsonDecode(q))).toList();

    setState(() {
      incorrectQuestions = loadedQuestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Câu trả lời sai')),
      body: incorrectQuestions.isEmpty
          ? const Center(child: Text('Không có câu trả lời sai nào được lưu.'))
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
                        Text(
                          'Câu ${index + 1}: ${q.questionText}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        ...List.generate(q.answers.length, (i) {
                          final isCorrect = i == q.correctAnswerIndex;
                          return Text(
                            '${String.fromCharCode(65 + i)}. ${q.answers[i]} ${isCorrect ? '✅' : ''}',
                            style: TextStyle(
                                color: isCorrect ? Colors.green : null),
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
