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

  Map<String, dynamic> toJson() => {
        'id': id,
        'questionText': questionText,
        'answers': answers,
        'correctAnswerIndex': correctAnswerIndex,
        'isDiemLiet': isDiemLiet,
      };

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'],
        indexNumber: json['indexNumber'],
        questionText: json['questionText'],
        answers: List<String>.from(json['answers']),
        correctAnswerIndex: json['correctAnswerIndex'],
        isDiemLiet: json['isDiemLiet'],
      );
}
