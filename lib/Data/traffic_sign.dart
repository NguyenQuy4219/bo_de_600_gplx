class TrafficSign {
  final String id;
  final String title;
  final String description;
  final String imagePath;

  TrafficSign({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

final List<TrafficSign> trafficSigns = [
  TrafficSign(
    id: 'P.102',
    title: 'Cấm đi ngược chiều',
    description:
        'Biển báo đường cấm tất cả các loại phương tiện tham gia giao thông đi vào theo chiều đặt biển.',
    imagePath: 'assets/cam_di_nguoc_chieu.jpg',
  ),
  TrafficSign(
    id: 'P.103a',
    title: 'Cấm ô tô',
    description:
        'Biển báo đường cấm tất cả các loại xe cơ giới kể cả mô tô 3 bánh có thùng, trừ mô tô 2 bánh, xe gắn máy.',
    imagePath: 'assets/cam_dung_oto.jpg',
  ),
  TrafficSign(
    id: 'P.103b',
    title: 'Cấm ô tô rẽ phải',
    description:
        'Biển báo đường cấm xe ô tô rẽ phải (kể cả xe mô tô ba bánh), trừ xe ưu tiên theo Luật Giao thông đường bộ.',
    imagePath: 'assets/cam_o_to_re_phai.jpg',
  ),
  TrafficSign(
    id: 'P.103c',
    title: 'Cấm ô tô rẽ trái',
    description:
        'Biển báo đường cấm xe ô tô rẽ trái (kể cả xe mô tô ba bánh), trừ xe ưu tiên theo Luật Giao thông đường bộ.',
    imagePath: 'assets/cam_o_to_re_trai.jpg',
  ),
  TrafficSign(
    id: 'P.112',
    title: 'Cấm người đi bộ',
    description: 'Cấm người đi bộ đi lại vào làn đường.',
    imagePath: 'assets/cam_nguoi_di_bo.jpg',
  ),
];
