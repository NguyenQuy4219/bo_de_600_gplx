import 'package:flutter/material.dart';
import '../models/trafficSign.dart';
import '../services/trafficSign_service.dart';
import 'traffic_sign_detail_page.dart';

class TrafficSignsScreen extends StatelessWidget {
  const TrafficSignsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TrafficSign>>(
      future: TrafficSignService().fetchAll(),
      builder: (ctx, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
        if (snap.hasError) {
          return Scaffold(body: Center(child: Text('Error: ${snap.error}')));
        }

        final signs = snap.data!;
        final prohibitory =
            signs.where((s) => s.signId.startsWith('P.')).toList();
        final warning = signs.where((s) => s.signId.startsWith('W.')).toList();
        final mandatory =
            signs.where((s) => s.signId.startsWith('R.')).toList();

        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Biển báo giao thông'),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Cấm'),
                  Tab(text: 'Nguy hiểm'),
                  Tab(text: 'Hiệu lệnh')
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _buildList(context, prohibitory),
                _buildList(context, warning),
                _buildList(context, mandatory),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildList(BuildContext c, List<TrafficSign> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, i) {
        final s = list[i];
        return ListTile(
          leading: Image.network(s.imageUrl,
              width: 48, height: 48, fit: BoxFit.cover),
          title: Text('${s.signId} — ${s.title}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(s.description),
          onTap: () => Navigator.push(
            c,
            MaterialPageRoute(builder: (_) => TrafficSignDetailPage(sign: s)),
          ),
        );
      },
    );
  }
}
