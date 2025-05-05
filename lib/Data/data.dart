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
