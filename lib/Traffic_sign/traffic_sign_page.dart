import 'package:flutter/material.dart';
import '../data/data.dart';
import '../data/traffic_sign.dart';
import 'traffic_sign_detail_page.dart';

class TrafficSignsScreen extends StatelessWidget {
  const TrafficSignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Biển báo giao thông'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Biển báo cấm'),
              Tab(text: 'Biển báo nguy hiểm'),
              Tab(text: 'Biển báo hiệu lệnh'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildSignList(trafficSigns),
            _buildSignList(dangerSigns),
            _buildSignList(mandantorySigns),
          ],
        ),
      ),
    );
  }

  Widget _buildSignList(List<TrafficSign> signs) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: signs.length,
      itemBuilder: (context, index) {
        final sign = signs[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2,
            child: ListTile(
              leading: Image.asset(
                sign.imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                sign.id,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sign.title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(sign.description),
                ],
              ),
              isThreeLine: true,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrafficSignDetailScreen(sign: sign),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
