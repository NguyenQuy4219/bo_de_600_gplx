import 'package:bo_de_600_gplx/Question/Top_50_questions_wrong.dart';
import 'package:bo_de_600_gplx/Review-question/review_question_list_page.dart';
import 'package:bo_de_600_gplx/Set-of-question/exam_list.dart';

import 'Traffic_sign/traffic_sign_page.dart';
import 'package:flutter/material.dart';
import 'Question/random_question_page.dart';
import 'Question/60_Questions_page.dart';
import 'Tip/Tip_page.dart';
import 'Settings/setting_page.dart';
import 'Data/data.dart';
// import 'Data/traffic_sign.dart';
import 'Question/wrong_questions.dart';
// import 'Data/traffic_sign.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
        ),
      ),
      home: const MyHomePage(title: '600 Câu hỏi GPLX'),
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
  void _handleFeatureTap(String title) {
    if (title == '60 câu điểm liệt') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => QuestionScreen()));
    } else if (title == 'Mẹo ghi nhớ') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TipsScreen()));
    } else if (title == 'Đề ngẫu nhiên') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CauHoiNgauNhienPage()));
    } else if (title == 'Các biển báo') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => TrafficSignsScreen()));
    } else if (title == 'Xem câu bị sai') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const IncorrectQuestionsPage(),
        ),
      );
    } else if (title == 'Thi theo bộ đề') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ExamListScreen()));
    } else if (title == 'Top 50 câu sai') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Top50QuestionScreen()));
    } else if (title == 'Ôn tập câu hỏi') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => StudyProgressPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
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
              onPressed: () => _handleFeatureTap(item['title']),
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
