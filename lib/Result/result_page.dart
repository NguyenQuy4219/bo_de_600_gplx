import 'package:flutter/material.dart';
import 'history_page.dart';

class ResultPage extends StatelessWidget {
  final int correctCount;
  final int totalQuestions;

  const ResultPage({
    super.key,
    required this.correctCount,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double scorePercent = (correctCount / totalQuestions) * 100;
    Color scoreColor = scorePercent >= 80
        ? Colors.green
        : (scorePercent >= 50 ? Colors.orange : Colors.red);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kết quả bài thi'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '🎯 Bạn đã hoàn thành bài thi!',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 24),
              Text(
                '$correctCount / $totalQuestions câu đúng',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: scoreColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Tỷ lệ đúng: ${scorePercent.toStringAsFixed(1)}%',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  icon: const Icon(Icons.home),
                  label: const Text('Quay về trang chủ'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HistoryPage()),
                    );
                  },
                  icon: const Icon(Icons.history),
                  label: const Text('Xem lịch sử làm bài'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
