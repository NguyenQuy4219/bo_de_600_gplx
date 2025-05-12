import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: StudyProgressPage()));

class StudyProgressPage extends StatelessWidget {
  final List<CategoryProgress> categories = [
    CategoryProgress(
      'Khái niệm và quy tắc giao thông đường bộ',
      0,
      139,
      note: 'Từ câu 1 đến 139, gồm 41 câu điểm liệt.',
      routeBuilder: () => DummyPage(title: 'Khái niệm và quy tắc'),
    ),
    CategoryProgress(
      'Văn hóa, đạo đức nghề nghiệp người lái xe',
      0,
      21,
      note: 'Từ câu 140 đến 160, gồm 4 câu điểm liệt.',
      routeBuilder: () => DummyPage(title: 'Văn hóa, đạo đức nghề'),
    ),
    CategoryProgress(
      'Kỹ thuật lái xe',
      0,
      18,
      note: 'Từ câu 161 đến 178, gồm 5 câu điểm liệt.',
      routeBuilder: () => DummyPage(title: 'Kỹ thuật lái xe'),
    ),
    CategoryProgress(
      'Cấu tạo và sửa chữa xe',
      0,
      7,
      note: 'Từ câu 179 đến 185.',
      routeBuilder: () => DummyPage(title: 'Cấu tạo & sửa chữa xe'),
    ),
    CategoryProgress(
      'Hệ thống biển báo hiệu đường bộ',
      0,
      182,
      note: 'Từ câu 186 đến 367.',
      routeBuilder: () => DummyPage(title: 'Biển báo hiệu đường bộ'),
    ),
    CategoryProgress(
      'Giải các thế sa hình',
      0,
      83,
      note: 'Từ câu 368 đến 450.',
      routeBuilder: () => DummyPage(title: 'Thế sa hình'),
    ),
    CategoryProgress(
      'Câu hỏi về tình huống mất an toàn giao thông nghiêm trọng',
      0,
      50,
      note: '50 câu hỏi điểm liệt bắt buộc phải trả lời đúng.',
      routeBuilder: () => DummyPage(title: 'Tình huống nghiêm trọng'),
    ),
  ];

  StudyProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hạng A: Ôn 450 câu')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final percent = cat.total == 0 ? 0 : cat.correct / cat.total;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => cat.routeBuilder()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cat.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  if (cat.note != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(cat.note!,
                          style: TextStyle(color: Colors.grey[700])),
                    ),
                  const SizedBox(height: 6),
                  Text('${cat.correct} / ${cat.total}',
                      style: const TextStyle(color: Colors.blue)),
                  LinearProgressIndicator(
                    value: percent.toDouble(),
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                    minHeight: 6,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryProgress {
  final String title;
  final int correct;
  final int total;
  final String? note;
  final Widget Function() routeBuilder;

  CategoryProgress(this.title, this.correct, this.total,
      {this.note, required this.routeBuilder});
}

class DummyPage extends StatelessWidget {
  final String title;
  const DummyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Trang ôn tập: $title')),
    );
  }
}
