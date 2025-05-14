import 'package:flutter/material.dart';
import 'history_page.dart';

class ResultPage extends StatelessWidget {
  final int correctCount;
  final int totalQuestions;
  final Duration duration;
  final List<bool?> answerResults;
  final List<bool> isDiemLietList;

  const ResultPage({
    super.key,
    required this.correctCount,
    required this.totalQuestions,
    required this.duration,
    required this.answerResults,
    required this.isDiemLietList,
  });

  bool get hasDiemLiet {
    for (int i = 0; i < answerResults.length; i++) {
      if (isDiemLietList[i] && answerResults[i] == false) return true;
    }
    return false;
  }

  String formatDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final incorrect = answerResults.where((e) => e == false).length;
    final unanswered = answerResults.where((e) => e == null).length;
    final scorePercent = (correctCount / totalQuestions) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kết quả đề thi'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            color: hasDiemLiet || correctCount < 21
                ? Colors.red.shade100
                : Colors.green.shade100,
            padding: const EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            child: Text(
              hasDiemLiet
                  ? 'KHÔNG ĐẠT: SAI CÂU ĐIỂM LIỆT!'
                  : (correctCount >= 21
                      ? 'ĐẠT: CHÚC MỪNG!'
                      : 'KHÔNG ĐẠT: CHƯA ĐỦ SỐ CÂU ĐÚNG'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: hasDiemLiet || correctCount < 21
                    ? Colors.red
                    : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSummary(Icons.timer, formatDuration(duration), Colors.blue),
              _buildSummary(Icons.check_circle, '$correctCount', Colors.green),
              _buildSummary(Icons.cancel, '$incorrect', Colors.red),
              _buildSummary(Icons.help_outline, '$unanswered', Colors.grey),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(answerResults.length, (index) {
                  Icon icon;
                  Color bgColor;

                  if (answerResults[index] == true) {
                    icon = const Icon(Icons.check, color: Colors.green);
                    bgColor = Colors.green.shade50;
                  } else if (answerResults[index] == false) {
                    icon = const Icon(Icons.close, color: Colors.red);
                    bgColor = Colors.red.shade50;
                  } else {
                    icon = const Icon(Icons.help_outline, color: Colors.grey);
                    bgColor = Colors.grey.shade200;
                  }

                  return Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Câu ${index + 1}'),
                        const SizedBox(height: 4),
                        icon,
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    icon: const Icon(Icons.home),
                    label: const Text('Quay về trang chủ'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HistoryPage()),
                      );
                    },
                    icon: const Icon(Icons.history),
                    label: const Text('Xem lịch sử làm bài'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSummary(IconData icon, String text, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
