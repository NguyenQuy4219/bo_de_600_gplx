import 'dart:async';
import 'dart:convert';
import 'package:bo_de_600_gplx/Question/wrong_questions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bo_de_600_gplx/Data/data.dart';
import 'package:bo_de_600_gplx/Result/result_page.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Question> fatalQuestions = [];
  List<Question> incorrectQuestions = [];
  int currentIndex = 0;
  int? selectedOption;
  List<bool?> answerResults = [];

  Duration examDuration = const Duration(minutes: 15);
  late Duration remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingTime = examDuration;
    fatalQuestions = questions.where((q) => q.isDiemLiet).toList()..shuffle();
    fatalQuestions = fatalQuestions.take(60).toList();
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

  void checkAnswer() async {
    final question = fatalQuestions[currentIndex];
    final isCorrect = selectedOption == question.correctAnswerIndex;
    answerResults[currentIndex] = isCorrect;

    if (!isCorrect && !incorrectQuestions.any((q) => q.id == question.id)) {
      incorrectQuestions.add(question);
    }

    if (currentIndex == fatalQuestions.length - 1) {
      await _saveIncorrectQuestions();
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

  Future<void> _saveIncorrectQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList =
        incorrectQuestions.map((q) => jsonEncode(q.toJson())).toList();
    await prefs.setStringList('incorrect_questions', jsonList);
  }

  void _showTimeUpDialog() async {
    await _saveIncorrectQuestions();

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
              _navigateToResultPage();
            },
            child: const Text('Xem kết quả'),
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
              _navigateToResultPage();
            },
            child: const Text('Có'),
          ),
        ],
      ),
    );
  }

  void _navigateToResultPage() {
    final correctCount = answerResults.where((e) => e == true).length;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          correctCount: correctCount,
          totalQuestions: fatalQuestions.length,
          duration: examDuration - remainingTime,
          answerResults: answerResults,
          isDiemLietList: fatalQuestions.map((q) => q.isDiemLiet).toList(),
        ),
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
                    onPressed: () async {
                      await _saveIncorrectQuestions();
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
                        color: Colors.red,
                      ),
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
