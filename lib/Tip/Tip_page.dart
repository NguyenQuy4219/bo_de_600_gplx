import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Các mẹo ghi nhớ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mẹo 600 câu hỏi ôn thi GPLX',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              SizedBox(height: 20),
              Text('Cấp phép',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              bulletPoint(
                  'Đường cấm dừng, cấm đỗ, cấm đi do UBND cấp tỉnh cấp'),
              bulletPoint(
                  'Xe quá khổ, quá tải do: cơ quan quản lý đường bộ có thẩm quyền cấp phép'),
              SizedBox(height: 20),
              Text('Nồng độ cồn',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              bulletPoint(
                'Người điều khiển xe mô tô, ô tô, máy kéo trên đường mà trong máu hoặc hơi thở có nồng độ cồn: '
                'Bị nghiêm cấm',
              ),
              SizedBox(height: 20),
              Text('Khoảng cách an toàn tối thiểu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              bulletPoint('35m nếu vận tốc lưu hành(V) = 60 (km/h)'),
              bulletPoint('55m nếu 60<V≤80'),
              bulletPoint('70m nếu 80<V≤100'),
              bulletPoint('100m nếu 100<V≤120'),
              bulletPoint('Dưới 60km/h: Chủ động và đảm bảo khoảng cách.'),
              SizedBox(height: 20),
              Text('Hỏi về tuổi (T)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              bulletPoint('Tuổi tối đa hạng E: nam 55, nữ 50'),
              bulletPoint('Tuổi lấy bằng lái xe (cách nhau 3 tuổi):'),
              bulletPoint('Gắn máy: 16T (dưới 50cm3)', indent: 16),
              bulletPoint('Mô tô + B1 + B2: 18T', indent: 16),
              SizedBox(height: 20),
              Text('Hỏi về tuổi (T)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              bulletPoint('Tuổi tối đa hạng E: nam 55, nữ 50'),
              bulletPoint('Tuổi lấy bằng lái xe (cách nhau 3 tuổi):'),
              bulletPoint('Gắn máy: 16T (dưới 50cm3)', indent: 16),
              bulletPoint('Mô tô + B1 + B2: 18T', indent: 16),
              SizedBox(height: 20),
              Text('Hỏi về tuổi (T)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              bulletPoint('Tuổi tối đa hạng E: nam 55, nữ 50'),
              bulletPoint('Tuổi lấy bằng lái xe (cách nhau 3 tuổi):'),
              bulletPoint('Gắn máy: 16T (dưới 50cm3)', indent: 16),
              bulletPoint('Mô tô + B1 + B2: 18T', indent: 16),
              SizedBox(height: 20),
              Text('Hỏi về tuổi (T)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              bulletPoint('Tuổi tối đa hạng E: nam 55, nữ 50'),
              bulletPoint('Tuổi lấy bằng lái xe (cách nhau 3 tuổi):'),
              bulletPoint('Gắn máy: 16T (dưới 50cm3)', indent: 16),
              bulletPoint('Mô tô + B1 + B2: 18T', indent: 16),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget bulletPoint(String text, {double indent = 0}) {
    return Padding(
      padding: EdgeInsets.only(left: indent + 8, top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 20))),
        ],
      ),
    );
  }
}
