import 'package:pocketbase/pocketbase.dart';
import '../models/question.dart';

class QuestionService {
  Future<List<Question>> fetchQuestions() async {
    final pb = PocketBase('http://127.0.0.1:8090');
    final records = await pb.collection('questions').getFullList();
    return records.map((rec) {
      final raw = rec.data['answers'];
      final answers = List<String>.from(raw as List);
      return Question(
        id: rec.id,
        indexNumber: rec.data['indexNumber'],
        questionText: rec.data['questionText'],
        answers: answers,
        correctAnswerIndex: rec.data['correctAnswerIndex'],
        isDiemLiet: rec.data['isDiemLiet'],
      );
    }).toList();
  }
}
