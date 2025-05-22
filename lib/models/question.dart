// import 'package:pocketbase/pocketbase.dart';

class Question {
  final String id;
  final int indexNumber;
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;
  final bool isDiemLiet;

  Question({
    required this.id,
    required this.indexNumber,
    required this.questionText,
    required this.answers,
    required this.correctAnswerIndex,
    required this.isDiemLiet,
  });
}


