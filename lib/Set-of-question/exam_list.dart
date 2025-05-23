import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/question_service.dart';
import '../models/question.dart';
import 'exam_screen.dart';

class ExamListScreen extends StatefulWidget {
  const ExamListScreen({Key? key}) : super(key: key);

  @override
  State<ExamListScreen> createState() => _ExamListScreenState();
}

class _ExamListScreenState extends State<ExamListScreen> {
  final QuestionService _service = QuestionService();
  Map<int, Map<String, dynamic>> examResults = {};

  @override
  void initState() {
    super.initState();
    _loadExamResults();
  }

  Future<void> _loadExamResults() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('history') ?? [];

    final parsed = <int, Map<String, dynamic>>{};
    for (var item in list) {
      try {
        final data = json.decode(item) as Map<String, dynamic>;
        if (data.containsKey('exam')) {
          parsed[data['exam'] as int] = data;
        }
      } catch (_) {}
    }

    setState(() => examResults = parsed);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Question>>(
      future: _service.fetchQuestions(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Lỗi tải câu hỏi: \${snapshot.error}')),
          );
        }

        final allQuestions = snapshot.data!;
        const perExam = 60;
        final totalExams = 12;
        final examSets = List<List<Question>>.generate(
          totalExams,
          (i) => allQuestions.skip(i * perExam).take(perExam).toList(),
        );

        return Scaffold(
          appBar: AppBar(title: const Text('Đề thi Hạng A')),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(totalExams, (index) {
                final examIndex = index + 1;
                final result = examResults[examIndex];
                final correct = result?['correct'] as int?;
                final total = result?['total'] as int?;
                final hasDiemLiet = result?['isDiemLiet'] as bool? ?? false;
                final passed = (correct != null && total != null)
                    ? (correct >= 21 && !hasDiemLiet)
                    : false;

                Color? bgColor;
                if (correct != null) {
                  bgColor = passed ? Colors.green : Colors.red;
                }

                return GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExamScreen(
                          examIndex: examIndex,
                          examQuestions: examSets[index],
                        ),
                      ),
                    );
                    _loadExamResults();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor ?? Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Đề thi số $examIndex',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        if (correct != null && total != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.check_circle,
                                  color: Colors.green, size: 16),
                              const SizedBox(width: 4),
                              Text('\$correct',
                                  style: const TextStyle(color: Colors.green)),
                              const SizedBox(width: 12),
                              const Icon(Icons.cancel,
                                  color: Colors.red, size: 16),
                              const SizedBox(width: 4),
                              Text('\${total - correct}',
                                  style: const TextStyle(color: Colors.red)),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
