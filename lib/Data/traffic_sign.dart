import 'package:flutter/material.dart';

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
    imagePath: 'assets/cam-nguoi-di-bo.jpg',
  ),
  TrafficSign(
    id: 'P.111d',
    title: 'Cấm xe 3 bánh loại không động cơ',
    description:
        'Cấm xe ba bánh loại không có động cơ như xe xích lô, xe lôi đạp.',
    imagePath: 'assets/cam_xe_ko_dong_co.jpg',
  ),
];

final List<TrafficSign> dangerSigns = [
  TrafficSign(
    id: 'W.201a',
    title: 'Chỗ ngoặt nguy hiểm vòng bên trái',
    description: 'Báo trước sắp tới chỗ ngoặt vòng bên trái.',
    imagePath: 'assets/nguy-hiem-vong-ben-trai.jpg',
  ),
  TrafficSign(
    id: 'W.201b',
    title: 'Chỗ ngoặt nguy hiểm vòng bên phải',
    description: 'Báo trước sắp tới chỗ ngoặt vòng bên phải.',
    imagePath: 'assets/nguy-hiem-vong-ben-phai.jpg',
  ),
  TrafficSign(
    id: 'W.203a',
    title: 'Đường bị thu hẹp cả hai bên.',
    description: 'Báo trước đường sắp bị thu hẹp cả hai bên.',
    imagePath: 'assets/duong-thu-hep-2-ben.jpg',
  ),
  TrafficSign(
    id: 'W.203b',
    title: 'Đường bị thu hẹp bên trái',
    description: 'Báo trước đường sắp bị thu hẹp bên trái.',
    imagePath: 'assets/duong-thu-hep-ben-trai.jpg',
  ),
  TrafficSign(
    id: 'W.203c',
    title: 'Đường bị thu hẹp bên phải',
    description: 'Báo trước đường sắp bị thu hẹp bên phải.',
    imagePath: 'assets/duong-thu-hep-ben-phai.jpg',
  ),
  TrafficSign(
    id: 'W.204',
    title: 'Đường giao nhau với đường sắt',
    description:
        'Báo đoạn đường phía trước do sửa chữa hoặc có trở ngại khác nên phải đi vào phần đường còn lại hoặc đường tạm theo cả 2 chiều.',
    imagePath: 'assets/duong-hai-chieu.png',
  )
];

final List<TrafficSign> mandantorySigns = [
  TrafficSign(
    id: 'R.301a',
    title: 'Các xe chỉ được đi thẳng',
    description:
        'Các xe chỉ được đi thẳng (trừ xe được quyền ưu tiên theo quy định).',
    imagePath: 'assets/hieu-lenh-di-thang.jpg',
  ),
  TrafficSign(
    id: 'R.301b',
    title: ' Các xe chỉ được rẽ phải',
    description:
        'Các xe chỉ được rẽ phải (trừ xe được quyền ưu tiên theo quy định). Biển này được đặt ở sau  nơi đường giao nhau.',
    imagePath: 'assets/hieu-lenh-re-phai.jpg',
  ),
  TrafficSign(
    id: 'R.301c',
    title: 'Các xe chỉ được rẽ trái.',
    description:
        'Các xe chỉ được rẽ trái (trừ xe được quyền ưu tiên theo quy định). Biển này được đặt ở sau nơi đường giao nhau..',
    imagePath: 'assets/hieu-lenh-re-trai.jpg',
  ),
  TrafficSign(
    id: 'R.303',
    title: 'Nơi giao nhau chạy theo vòng xuyến',
    description:
        'Báo cho các loại xe (thô sơ và cơ giới) phải chạy vòng theo đảo an toàn ở nơi đường giao nhau..',
    imagePath: 'assets/hieu-lenh-giao-nhau.jpg',
  ),
  TrafficSign(
    id: 'R.301i',
    title: 'Các xe chỉ được rẽ trái và rẽ phải',
    description:
        'Các xe chỉ được rẽ phải và rẽ trái (trừ xe được quyền ưu tiên theo quy định).',
    imagePath: 'assets/hieu-lenh-re-phai-va-trai.jpg',
  ),
  TrafficSign(
    id: 'R.309',
    title: 'Ấn còi',
    description: 'Xe cộ đi đến vị trí cắm biển đó thì phải ấn còi.',
    imagePath: 'assets/bien-an-coi.jpg',
  )
];
