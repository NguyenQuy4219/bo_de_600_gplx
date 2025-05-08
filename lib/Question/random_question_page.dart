import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Data/data.dart';
import '../Result/result_page.dart';
import 'dart:convert';

class CauHoiNgauNhienPage extends StatefulWidget {
  const CauHoiNgauNhienPage({super.key});

  @override
  State<CauHoiNgauNhienPage> createState() => _CauHoiNgauNhienPageState();
}

class _CauHoiNgauNhienPageState extends State<CauHoiNgauNhienPage> {
  final int totalQuestions = 20;
  late List<Question> quizQuestions;
  int currentIndex = 0;
  int? selectedAnswer;
  List<int?> userAnswers = [];
  List<bool?> answerResults = [];

  Duration remainingTime = const Duration(minutes: 19);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _generateRandomQuiz();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (remainingTime.inSeconds > 0) {
            remainingTime = remainingTime - const Duration(seconds: 1);
          } else {
            timer.cancel();
            _navigateToResultPage();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _generateRandomQuiz() {
    quizQuestions = [...questions]..shuffle();
    quizQuestions = quizQuestions.take(totalQuestions).toList();
    userAnswers = List.filled(totalQuestions, null);
    answerResults = List.filled(totalQuestions, null);
  }

  void _checkAnswer() {
    final correct =
        selectedAnswer == quizQuestions[currentIndex].correctAnswerIndex;
    userAnswers[currentIndex] = selectedAnswer;
    answerResults[currentIndex] = correct;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(correct ? '✅ Chính xác!' : '❌ Sai rồi'),
        content: Text(
          'Đáp án đúng là: ${quizQuestions[currentIndex].answers[quizQuestions[currentIndex].correctAnswerIndex]}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                if (currentIndex < totalQuestions - 1) {
                  currentIndex++;
                  selectedAnswer = userAnswers[currentIndex];
                } else if (_isQuizCompleted()) {
                  _navigateToResultPage();
                }
              });
            },
            child: const Text('Tiếp tục'),
          )
        ],
      ),
    );
  }

  bool _isQuizCompleted() {
    return answerResults.where((e) => e != null).length == totalQuestions;
  }

  Future<void> _saveResultToPrefs(int correct) async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('history') ?? [];

    final entry = {
      'correct': correct,
      'total': totalQuestions,
      'timestamp': DateTime.now().toIso8601String(),
    };

    await prefs.setStringList('history', [
      ...history,
      jsonEncode(entry),
    ]);
  }

  void _navigateToResultPage() {
    _timer?.cancel();
    final correctCount = answerResults.where((e) => e == true).length;
    _saveResultToPrefs(correctCount);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          correctCount: correctCount,
          totalQuestions: totalQuestions,
        ),
      ),
    );
  }

  void _confirmExit() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Quay về trang chủ'),
        content:
            const Text('Bạn có chắc muốn kết thúc bài thi và xem kết quả?'),
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

  Future<bool> _onBackPressed() async {
    _confirmExit();
    return false;
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Widget _buildProgressBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: List.generate(totalQuestions, (index) {
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
                selectedAnswer = userAnswers[index];
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
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
    final question = quizQuestions[currentIndex];

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: _confirmExit,
                          icon: const Icon(Icons.home, color: Colors.white),
                        ),
                        Expanded(
                          child: Text(
                            'Câu ${currentIndex + 1}/$totalQuestions',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          _formatTime(remainingTime),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  _buildProgressBar(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.questionText,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      ...List.generate(question.answers.length, (index) {
                        return RadioListTile<int>(
                          title: Text(question.answers[index]),
                          value: index,
                          groupValue: selectedAnswer,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer = value;
                            });
                          },
                        );
                      }),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed:
                              selectedAnswer != null ? _checkAnswer : null,
                          child: const Text('Kiểm tra đáp án'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
