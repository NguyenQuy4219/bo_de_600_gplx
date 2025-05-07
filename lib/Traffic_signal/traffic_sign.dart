import 'package:flutter/material.dart';
import '/Data/traffic_sign.dart';

class TrafficSignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Biển báo cấm, nguy hiểm, hiệu lệnh 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Biển báo giao thông'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Biển báo cấm'),
              Tab(text: 'Biển báo nguy hiểm'),
              Tab(text: 'Biển báo hiệu lệnh'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildTrafficSignList(trafficSigns),
            Center(child: Text('Chưa có dữ liệu')),
            Center(child: Text('Chưa có dữ liệu')),
          ],
        ),
      ),
    );
  }

  Widget buildTrafficSignList(List<TrafficSign> signs) {
    return ListView.builder(
      itemCount: signs.length,
      itemBuilder: (context, index) {
        final sign = signs[index];
        return ListTile(
          leading: Image.asset(
            sign.imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          title: Text('${sign.id} ${sign.title}',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(sign.description),
          isThreeLine: true,
        );
      },
    );
  }
}
