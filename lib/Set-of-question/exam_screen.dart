import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Data/data.dart';
import '../Result/result_page.dart';
import 'dart:convert';

class ExamScreen extends StatefulWidget {
  final int examIndex;
  final List<Question> examQuestions;

  const ExamScreen({
    super.key,
    required this.examIndex,
    required this.examQuestions,
  });

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  int currentIndex = 0;
  int? selectedAnswer;
  List<int?> userAnswers = [];
  List<bool?> answerResults = [];

  Duration remainingTime = const Duration(minutes: 19);
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    userAnswers = List.filled(widget.examQuestions.length, null);
    answerResults = List.filled(widget.examQuestions.length, null);

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

  void _checkAnswer() {
    final question = widget.examQuestions[currentIndex];
    final correct = selectedAnswer == question.correctAnswerIndex;
    userAnswers[currentIndex] = selectedAnswer;
    answerResults[currentIndex] = correct;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(correct ? '✅ Chính xác!' : '❌ Sai rồi'),
        content: Text(
          'Đáp án đúng là: ${question.answers[question.correctAnswerIndex]}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                if (currentIndex < widget.examQuestions.length - 1) {
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
    return answerResults.where((e) => e != null).length ==
        widget.examQuestions.length;
  }

  Future<void> _saveResultToPrefs(int correctCount) async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('exam_history') ?? [];

    final entry = {
      'exam': widget.examIndex,
      'correct': correctCount,
      'total': widget.examQuestions.length,
      'hasDiemLiet': widget.examQuestions.asMap().entries.any((e) {
        final i = e.key;
        final q = e.value;
        return q.isDiemLiet && answerResults[i] == false;
      }),
      'timestamp': DateTime.now().toIso8601String(),
    };

    // Remove any previous result of this exam
    final filtered = history.where((h) {
      try {
        final data = json.decode(h);
        return data['exam'] != widget.examIndex;
      } catch (_) {
        return true;
      }
    }).toList();

    await prefs.setStringList('exam_history', [
      ...filtered,
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
          totalQuestions: widget.examQuestions.length,
          duration: const Duration(minutes: 19) - remainingTime,
          answerResults: answerResults,
          isDiemLietList:
              widget.examQuestions.map((q) => q.isDiemLiet).toList(),
        ),
      ),
    );
  }

  void _confirmExit() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Kết thúc đề thi'),
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
        children: List.generate(widget.examQuestions.length, (index) {
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
    final question = widget.examQuestions[currentIndex];

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
                            'Câu ${currentIndex + 1}/${widget.examQuestions.length}',
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
