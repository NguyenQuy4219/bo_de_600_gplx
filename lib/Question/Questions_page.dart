import 'package:flutter/material.dart';
import 'package:bo_de_600_gplx/Data/data.dart';

void main() => runApp(GPLXApp());

class GPLXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bộ câu hỏi điểm liệt',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuestionScreen(),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  int selectedOption = -1;

  void nextQuestion() {
    setState(() {
      if (currentIndex < questions.length - 1) {
        currentIndex++;
        selectedOption = -1;
      }
    });
  }

  void prevQuestion() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        selectedOption = -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bộ câu hỏi điểm liệt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Câu ${currentQuestion.id}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              currentQuestion.questionText,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...List.generate(currentQuestion.answers.length, (index) {
              return RadioListTile<int>(
                title: Text('${index + 1}. ${currentQuestion.answers[index]}'),
                value: index,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              );
            }),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
                    onPressed: prevQuestion,
                  ),
                  Text('60 CÂU HỎI',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.blue),
                    onPressed: nextQuestion,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
