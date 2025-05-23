import 'package:flutter/material.dart';
import '../models/trafficSign.dart';

class TrafficSignDetailPage extends StatelessWidget {
  final TrafficSign sign;
  const TrafficSignDetailPage({required this.sign, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(sign.signId)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(sign.imageUrl),
            const SizedBox(height: 16),
            Text(sign.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(sign.description),
          ],
        ),
      ),
    );
  }
}
