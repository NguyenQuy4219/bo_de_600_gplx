import 'package:flutter/material.dart';

final List<Map<String, dynamic>> features = [
  {'title': 'Đề ngẫu nhiên', 'color': Colors.orange, 'icon': Icons.shuffle},
  {
    'title': 'Thi theo bộ đề',
    'color': Colors.redAccent,
    'icon': Icons.library_books
  },
  {'title': 'Xem câu bị sai', 'color': Colors.lightGreen, 'icon': Icons.error},
  {'title': 'Ôn tập câu hỏi', 'color': Colors.teal, 'icon': Icons.school},
  {'title': 'Các biển báo', 'color': Colors.blue, 'icon': Icons.traffic},
  {
    'title': 'Mẹo ghi nhớ',
    'color': Colors.purple,
    'icon': Icons.tips_and_updates
  },
  {'title': '60 câu điểm liệt', 'color': Colors.brown, 'icon': Icons.warning},
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

final List<Map<String, String>> licenseTypes = const [
  {
    'title': 'HẠNG A1',
    'description':
        'Lái xe mô tô hai bánh có dung tích xi-lanh đến 125cm3 hoặc có công suất động cơ điện đến 11kW.',
  },
  {
    'title': 'HẠNG A',
    'description':
        'Lái xe mô tô hai bánh có dung tích xi-lanh trên 125cm3 hoặc có công suất động cơ điện trên 11kW và lái xe hạng A1.',
  },
  {
    'title': 'HẠNG B1',
    'description': 'Lái xe mô tô ba bánh và lái xe hạng A1.',
  },
  {
    'title': 'HẠNG B',
    'description':
        'Lái xe ô tô chở người đến 08 chỗ (không kể chỗ lái xe); xe ô tô tải và chuyên dùng đến 3.500 kg; xe có kéo rơ moóc đến 750 kg.',
  },
  {
    'title': 'HẠNG C1',
    'description':
        'Lái xe ô tô tải và chuyên dùng trên 3.500 kg đến 7.500 kg; xe có kéo rơ moóc đến 750 kg; và lái xe hạng B.',
  },
  {
    'title': 'HẠNG C',
    'description':
        'Lái xe ô tô tải và chuyên dùng trên 3.500 kg; xe có kéo rơ moóc đến 750 kg; và lái xe hạng B.',
  },
];

List<List<Question>> examSets = [];

void generateExamSets() {
  List<Question> shuffled = List.from(questions)..shuffle();
  for (int i = 0; i < 10; i++) {
    examSets.add(shuffled.skip(i * 60).take(60).toList());
  }
}

class Question {
  final int id;
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;
  final bool isDiemLiet;

  Question({
    required this.id,
    required this.questionText,
    required this.answers,
    required this.correctAnswerIndex,
    required this.isDiemLiet,
  });
}

final List<Question> questions = [
  Question(
    id: 1,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 2,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 3,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 4,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 5,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 6,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 7,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 8,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 9,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 10,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 11,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 12,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 13,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 14,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 15,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 16,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 17,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 18,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 19,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 20,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 21,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 22,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 23,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 24,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 25,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 26,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 27,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 28,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 29,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 30,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 31,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 32,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 33,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 34,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 35,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 36,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 37,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 38,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 39,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 40,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 41,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 42,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 43,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 44,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 45,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 46,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 47,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 48,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 49,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 50,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 51,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 52,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 53,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 54,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 55,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 56,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 57,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 58,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 59,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 60,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 61,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 62,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 63,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 64,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 65,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 66,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 67,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 68,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 69,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 70,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 71,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 72,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 73,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 74,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 75,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 76,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 77,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 78,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 79,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 80,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 81,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 82,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 83,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 84,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 85,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 86,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 87,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 88,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 89,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 90,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 91,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 92,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 93,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 94,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 95,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 96,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 97,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 98,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 99,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 100,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 101,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 102,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 103,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 104,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 105,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 106,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 107,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 108,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 109,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 110,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 111,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 112,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 113,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 114,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 115,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 116,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 117,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 118,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 119,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 120,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 121,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 122,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 123,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 124,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 125,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 126,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 127,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 128,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 129,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 130,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 131,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 132,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 133,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 134,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 135,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 136,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 137,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 138,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 139,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 140,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 141,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 142,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 143,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 144,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 145,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 146,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 147,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 148,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 149,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 150,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 151,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 152,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 153,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 154,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 155,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 156,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 157,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 158,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 159,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 160,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 161,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 162,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 163,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 164,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 165,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 166,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 167,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 168,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 169,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 170,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 171,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 172,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 173,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 174,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 175,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 176,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 177,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 178,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 179,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 180,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 181,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 182,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 183,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 184,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 185,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 186,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 187,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 188,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 189,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 190,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 191,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 192,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 193,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 194,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 195,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 196,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 197,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
  Question(
    id: 198,
    questionText: 'Biển báo cấm xe mô tô có hình gì?',
    answers: [
      'Hình tam giác màu vàng viền đỏ.',
      'Hình tròn đỏ, nền trắng, có hình xe mô tô màu đen.',
      'Hình vuông nền xanh, có hình xe mô tô.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: false,
  ),
  Question(
    id: 199,
    questionText: 'Hành vi nào dưới đây bị nghiêm cấm?',
    answers: [
      'Bấm còi để xin vượt trong khu đông dân cư vào ban ngày.',
      'Điều khiển xe chạy dưới tốc độ tối thiểu.',
      'Lạng lách, đánh võng trên đường bộ.',
    ],
    correctAnswerIndex: 2,
    isDiemLiet: true,
  ),
  Question(
    id: 200,
    questionText:
        'Người điều khiển phương tiện giao thông phải làm gì khi gặp đèn đỏ?',
    answers: [
      'Tăng tốc độ để vượt qua ngã tư.',
      'Dừng lại trước vạch dừng.',
      'Quan sát nếu không có xe thì đi tiếp.',
    ],
    correctAnswerIndex: 1,
    isDiemLiet: true,
  ),
];
