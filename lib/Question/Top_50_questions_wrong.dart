import 'dart:async';
import 'package:flutter/material.dart';
import '../services/question_service.dart';
import '../models/question.dart';
import '../Result/result_page.dart';
import 'wrong_questions.dart';

class Top50QuestionScreen extends StatefulWidget {
  const Top50QuestionScreen({Key? key}) : super(key: key);

  @override
  State<Top50QuestionScreen> createState() => _Top50QuestionScreenState();
}

class _Top50QuestionScreenState extends State<Top50QuestionScreen> {
  final QuestionService _service = QuestionService();
  final int totalQuestions = 50;
  final Duration examDuration = const Duration(minutes: 15);

  List<Question>? fatalQuestions;
  List<Question> incorrectQuestions = [];
  List<bool?> answerResults = [];
  int currentIndex = 0;
  int? selectedOption;

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
    final list = List<Question>.from(all)..shuffle();
    setState(() {
      fatalQuestions = list.take(totalQuestions).toList();
      answerResults = List<bool?>.filled(totalQuestions, null);
      incorrectQuestions = [];
      _loading = false;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (remainingTime.inSeconds > 0) {
          remainingTime -= const Duration(seconds: 1);
        } else {
          _timer?.cancel();
          _showTimeUpDialog();
        }
      });
    });
  }

  void _onOptionSelected(int? value) {
    setState(() => selectedOption = value);
  }

  void _checkAnswer() {
    final q = fatalQuestions![currentIndex];
    final isCorrect = selectedOption == q.correctAnswerIndex;
    answerResults[currentIndex] = isCorrect;
    if (!isCorrect) incorrectQuestions.add(q);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isCorrect ? '✅ Chính xác!' : '❌ Sai rồi'),
        content: Text('Đáp án đúng: ${q.answers[q.correctAnswerIndex]}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (currentIndex < totalQuestions - 1) {
                setState(() {
                  currentIndex++;
                  selectedOption = null;
                });
              } else {
                _navigateToResultPage();
              }
            },
            child: const Text('Tiếp tục'),
          ),
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
                    builder: (_) => const IncorrectQuestionsPage()),
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

  void _navigateToResultPage() {
    _timer?.cancel();
    final correctCount = answerResults.where((e) => e == true).length;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          correctCount: correctCount,
          totalQuestions: totalQuestions,
          duration: examDuration - remainingTime,
          answerResults: answerResults,
          isDiemLietList: fatalQuestions!.map((q) => q.isDiemLiet).toList(),
        ),
      ),
    );
  }

  String _formatTime(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  Widget _buildProgressBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
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
              selectedOption = null;
            }),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 28,
              height: 28,
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
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final q = fatalQuestions![currentIndex];
    return WillPopScope(
      onWillPop: () async {
        _confirmExit();
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: Container(
                color: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: _confirmExit,
                        icon: const Icon(Icons.home, color: Colors.white)),
                    Expanded(
                        child: Text('Câu ${currentIndex + 1}/$totalQuestions',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18))),
                    IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const IncorrectQuestionsPage())),
                      icon:
                          const Icon(Icons.error_outline, color: Colors.white),
                    ),
                    Text(_formatTime(remainingTime),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
            ),
            _buildProgressBar(),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(q.questionText,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red)),
                      const SizedBox(height: 16),
                      ...List.generate(
                          q.answers.length,
                          (i) => RadioListTile<int>(
                              title: Text(q.answers[i]),
                              value: i,
                              groupValue: selectedOption,
                              onChanged: _onOptionSelected)),
                      const SizedBox(height: 20),
                      Center(
                          child: ElevatedButton(
                              onPressed:
                                  selectedOption != null ? _checkAnswer : null,
                              child: const Text('Kiểm tra đáp án'))),
                      const SizedBox(height: 80),
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
