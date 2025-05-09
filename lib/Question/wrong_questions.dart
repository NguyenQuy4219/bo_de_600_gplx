import 'package:flutter/material.dart';
import '../Data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import '../Data/data.dart'; // chứa lớp Question

class IncorrectQuestionsScreen extends StatelessWidget {
  final List<Question> incorrectQuestions;

  const IncorrectQuestionsScreen({super.key, required this.incorrectQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Câu trả lời sai')),
      body: ListView.builder(
        itemCount: incorrectQuestions.length,
        itemBuilder: (context, index) {
          final q = incorrectQuestions[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                        color: isCorrect ? Colors.green : null,
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


