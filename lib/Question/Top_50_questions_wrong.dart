import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bo_de_600_gplx/Data/data.dart';
import 'wrong_questions.dart';

class Top50QuestionScreen extends StatefulWidget {
  const Top50QuestionScreen({super.key});

  @override
  State<Top50QuestionScreen> createState() => _Top50QuestionScreenState();
}

class _Top50QuestionScreenState extends State<Top50QuestionScreen> {
  List<Question> fatalQuestions = [];
  List<Question> incorrectQuestions = [];
  int currentIndex = 0;
  int? selectedOption;
  List<bool?> answerResults = [];

  Duration remainingTime = const Duration(minutes: 15);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    fatalQuestions = questions.take(50).toList();
    answerResults = List.filled(fatalQuestions.length, null);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (remainingTime.inSeconds > 0) {
          remainingTime -= const Duration(seconds: 1);
        } else {
          timer.cancel();
          _showTimeUpDialog();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void nextQuestion() {
    if (currentIndex < fatalQuestions.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = null;
      });
    }
  }

  void checkAnswer() {
    final question = fatalQuestions[currentIndex];
    final isCorrect = selectedOption == question.correctAnswerIndex;
    answerResults[currentIndex] = isCorrect;
    if (!isCorrect && !incorrectQuestions.any((q) => q.id == question.id)) {
      incorrectQuestions.add(question);
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isCorrect ? '✅ Chính xác!' : '❌ Sai rồi'),
        content: Text(
          'Đáp án đúng là: ${question.answers[question.correctAnswerIndex]}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              nextQuestion();
            },
            child: const Text('Tiếp tục'),
          )
        ],
      ),
    );
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('⏰ Hết giờ'),
        content: const Text('Bạn đã hết thời gian làm bài.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IncorrectQuestionsPage(),
                ),
              );
            },
            child: const Text('Xem câu sai'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Về trang chủ'),
          ),
        ],
      ),
    );
  }

  void _confirmExit() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Quay về trang chủ'),
        content:
            const Text('Bạn có chắc muốn kết thúc bài và quay về trang chủ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Không'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Có'),
          ),
        ],
      ),
    );
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Widget _buildProgressBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: List.generate(fatalQuestions.length, (index) {
          Color color;
          if (index == currentIndex) {
            color = Colors.blue;
          } else if (answerResults[index] == true) {
            color = Colors.green;
          } else if (answerResults[index] == false) {
            color = Colors.red;
          } else {
            color = Colors.grey.shade400;
          }

          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                selectedOption = null;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = fatalQuestions[currentIndex];

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Row(
                children: [
                  IconButton(
                    onPressed: _confirmExit,
                    icon: const Icon(Icons.home, color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      'Câu ${currentIndex + 1} / ${fatalQuestions.length}',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.error_outline, color: Colors.black),
                    tooltip: 'Xem câu sai',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IncorrectQuestionsPage(),
                        ),
                      );
                    },
                  ),
                  Text(
                    _formatTime(remainingTime),
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          _buildProgressBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.questionText,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(question.answers.length, (index) {
                      return RadioListTile<int>(
                        title: Text(' ${question.answers[index]}'),
                        value: index,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      );
                    }),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: selectedOption != null ? checkAnswer : null,
                        child: const Text('Kiểm tra đáp án'),
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
