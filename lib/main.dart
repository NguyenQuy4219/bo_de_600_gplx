import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '600 Câu hỏi GPLX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '200 câu GPLX Hạng A1'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> features = [
    {'title': 'Đề ngẫu nhiên', 'color': Colors.orange, 'icon': Icons.shuffle},
    {
      'title': 'Thi theo bộ đề',
      'color': Colors.redAccent,
      'icon': Icons.library_books
    },
    {
      'title': 'Xem câu bị sai',
      'color': Colors.lightGreen,
      'icon': Icons.error
    },
    {'title': 'Ôn tập câu hỏi', 'color': Colors.teal, 'icon': Icons.school},
    {'title': 'Các biển báo', 'color': Colors.blue, 'icon': Icons.traffic},
    {
      'title': 'Mẹo ghi nhớ',
      'color': Colors.purple,
      'icon': Icons.tips_and_updates
    },
    {'title': '20 câu điểm liệt', 'color': Colors.brown, 'icon': Icons.warning},
    {
      'title': 'Top 50 câu sai',
      'color': Colors.blueGrey,
      'icon': Icons.leaderboard
    },
    {
      'title': '120 mô phỏng',
      'color': Colors.lightBlueAccent,
      'icon': Icons.play_circle
    },
    {'title': 'Bỏ quảng cáo', 'color': Colors.red, 'icon': Icons.block},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: features.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.4,
          ),
          itemBuilder: (context, index) {
            final item = features[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: item['color'],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // You can define navigation or actions here.
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], color: Colors.white),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      item['title'],
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
