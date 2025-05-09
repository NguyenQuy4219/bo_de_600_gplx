import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final raw1 = prefs.getStringList('history') ?? [];
    final raw2 = prefs.getStringList('exam_history') ?? [];

    final parsed = [...raw1, ...raw2]
        .map((e) {
          try {
            return Map<String, dynamic>.from(json.decode(e));
          } catch (_) {
            return null;
          }
        })
        .where((e) => e != null)
        .cast<Map<String, dynamic>>()
        .toList();

    parsed.sort((a, b) => b['timestamp'].compareTo(a['timestamp']));

    setState(() {
      history = parsed;
    });
  }

  Future<void> _clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('history');
    setState(() {
      history.clear();
    });
  }

  String formatTimestamp(String iso) {
    final dt = DateTime.tryParse(iso);
    if (dt == null) return iso;
    return '${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử làm bài'),
        backgroundColor: Colors.blue,
        actions: [
          if (history.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Xóa toàn bộ lịch sử',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Xóa lịch sử bài làm'),
                    content:
                        const Text('Bạn có chắc muốn xóa toàn bộ lịch sử?'),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Không')),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _clearHistory();
                        },
                        child: const Text('Xóa'),
                      ),
                    ],
                  ),
                );
              },
            )
        ],
      ),
      body: history.isEmpty
          ? const Center(child: Text('Chưa có kết quả nào.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];
                final correct = item['correct'];
                final total = item['total'];
                final time = formatTimestamp(item['timestamp']);
                final percent = ((correct / total) * 100).toStringAsFixed(1);

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.check_circle_outline,
                        color: Colors.green),
                    title: Text('$correct / $total đúng - $percent%'),
                    subtitle: Text('Lúc: $time'),
                  ),
                );
              },
            ),
    );
  }
}
