import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Data/data.dart';
import 'exam_screen.dart';

class ExamListScreen extends StatefulWidget {
  const ExamListScreen({super.key});

  @override
  State<ExamListScreen> createState() => _ExamListScreenState();
}

class _ExamListScreenState extends State<ExamListScreen> {
  Map<int, Map<String, dynamic>> examResults = {};

  @override
  void initState() {
    super.initState();
    _loadExamResults();
  }

  Future<void> _loadExamResults() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('exam_history') ?? [];

    final parsed = <int, Map<String, dynamic>>{};
    for (var item in list) {
      try {
        final data = json.decode(item);
        parsed[data['exam']] = data;
      } catch (_) {}
    }

    setState(() {
      examResults = parsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    const int totalExams = 18;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đề thi Hạng A'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(totalExams, (index) {
            final examIndex = index + 1;
            final start = index * 60;
            final examQuestions = questions.skip(start).take(60).toList();

            final result = examResults[examIndex];
            final correct = result?['correct'];
            final total = result?['total'] ?? 25;
            final hasDiemLiet = result?['hasDiemLiet'] ?? false;
            final passed = correct != null && correct >= 21 && !hasDiemLiet;

            Color? bgColor;
            if (correct != null) {
              bgColor = passed ? Colors.green.shade100 : Colors.red.shade100;
            }

            return GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExamScreen(
                      examIndex: examIndex,
                      examQuestions: examQuestions,
                    ),
                  ),
                );
                _loadExamResults(); // refresh lại khi quay về
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
                    if (correct != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.check_circle,
                              color: Colors.green, size: 16),
                          const SizedBox(width: 4),
                          Text('$correct',
                              style: const TextStyle(color: Colors.green)),
                          const SizedBox(width: 12),
                          const Icon(Icons.cancel, color: Colors.red, size: 16),
                          const SizedBox(width: 4),
                          Text('${(total - correct)}',
                              style: const TextStyle(color: Colors.red)),
                        ],
                      )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
