import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/question_service.dart';
import '../models/question.dart';
import '../Result/result_page.dart';
import 'wrong_questions.dart';

class CauHoiNgauNhienPage extends StatefulWidget {
  const CauHoiNgauNhienPage({Key? key}) : super(key: key);

  @override
  State<CauHoiNgauNhienPage> createState() => _CauHoiNgauNhienPageState();
}

class _CauHoiNgauNhienPageState extends State<CauHoiNgauNhienPage> {
  final int totalQuestions = 20;
  final Duration examDuration = const Duration(minutes: 19);
  final QuestionService _service = QuestionService();

  List<Question>? quizQuestions;
  int currentIndex = 0;
  int? selectedAnswer;
  late List<int?> userAnswers;
  late List<bool?> answerResults;
  List<Question> incorrectQuestions = [];

  late Duration remainingTime;
  Timer? _timer;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    remainingTime = examDuration;
    _loadQuestions();
    _startTimer();
  }

  Future<void> _loadQuestions() async {
    final all = await _service.fetchQuestions();
    final shuffled = List<Question>.from(all)..shuffle(Random());
    setState(() {
      quizQuestions = shuffled.take(totalQuestions).toList();
      userAnswers = List.filled(totalQuestions, null);
      answerResults = List.filled(totalQuestions, null);
      incorrectQuestions = [];
      _loading = false;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (remainingTime.inSeconds > 0) {
          remainingTime = remainingTime - const Duration(seconds: 1);
        } else {
          _timer?.cancel();
          _navigateToResultPage();
        }
      });
    });
  }

  void _onAnswerSelected(int index) {
    setState(() {
      selectedAnswer = index;
    });
  }

  void _checkAnswer() {
    final question = quizQuestions![currentIndex];
    final correct = selectedAnswer == question.correctAnswerIndex;
    userAnswers[currentIndex] = selectedAnswer;
    answerResults[currentIndex] = correct;
    if (!correct) incorrectQuestions.add(question);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(correct ? '✅ Chính xác!' : '❌ Sai rồi'),
        content: Text(
            'Đáp án đúng: ${question.answers[question.correctAnswerIndex]}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                if (currentIndex < totalQuestions - 1) {
                  currentIndex++;
                  selectedAnswer = userAnswers[currentIndex];
                } else {
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

  bool _isQuizCompleted() =>
      answerResults.where((e) => e != null).length == totalQuestions;

  Future<void> _saveIncorrectQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList =
        incorrectQuestions.map((q) => jsonEncode(q.toJson())).toList();
    await prefs.setStringList('incorrect_questions', jsonList);
  }

  Future<void> _saveResultToPrefs(int correct) async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('history') ?? [];
    final entry = jsonEncode({
      'correct': correct,
      'total': totalQuestions,
      'timestamp': DateTime.now().toIso8601String(),
    });
    await prefs.setStringList('history', [...history, entry]);
  }

  void _navigateToResultPage() {
    _timer?.cancel();
    final correctCount = answerResults.where((e) => e == true).length;
    _saveResultToPrefs(correctCount);
    _saveIncorrectQuestions();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          correctCount: correctCount,
          totalQuestions: totalQuestions,
          duration: examDuration - remainingTime,
          answerResults: answerResults,
          isDiemLietList: quizQuestions!.map((q) => q.isDiemLiet).toList(),
        ),
      ),
    );
  }

  void _confirmExit() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Quay về trang chủ'),
        content: const Text('Kết thúc bài thi bây giờ và xem kết quả?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Không')),
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

  Future<bool> _onWillPop() async {
    _confirmExit();
    return false;
  }

  String _formatTime(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  Widget _buildProgressBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: List.generate(totalQuestions, (i) {
          Color c;
          if (i == currentIndex)
            c = Colors.blue;
          else if (answerResults[i] == true)
            c = Colors.green;
          else if (answerResults[i] == false)
            c = Colors.red;
          else
            c = Colors.grey.shade400;
          return GestureDetector(
            onTap: () => setState(() {
              currentIndex = i;
              selectedAnswer = userAnswers[i];
            }),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: c, borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text('${i + 1}',
                      style: const TextStyle(color: Colors.white))),
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    final question = quizQuestions![currentIndex];
    return WillPopScope(
      onWillPop: _onWillPop,
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
                            icon: const Icon(Icons.home, color: Colors.white)),
                        Expanded(
                          child: Text('Câu ${currentIndex + 1}/$totalQuestions',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.error_outline,
                              color: Colors.white),
                          tooltip: 'Xem câu sai',
                          onPressed: () async {
                            await _saveIncorrectQuestions();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const IncorrectQuestionsPage()));
                          },
                        ),
                        Text(_formatTime(remainingTime),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
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
                      Text(question.questionText,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      ...List.generate(question.answers.length, (i) {
                        return RadioListTile<int>(
                          title: Text(question.answers[i]),
                          value: i,
                          groupValue: selectedAnswer,
                          onChanged: (v) => _onAnswerSelected(v!),
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
