import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/Data/data.dart';
import '../main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedLicenseType = 'HẠNG A1'; // Mặc định

  @override
  void initState() {
    super.initState();
    _loadSelectedLicense(); // Load từ SharedPreferences
  }

  Future<void> _loadSelectedLicense() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLicenseType = prefs.getString('selected_license') ?? 'HẠNG A1';
    });
  }

  Future<void> _saveSelectedLicense(String license) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_license', license);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thiết lập'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Cập nhật 94 câu hỏi lý thuyết 2025',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Thực hiện cập nhật'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Thêm logic cập nhật
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'Chọn bằng lái xe',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          ...licenseTypes.map((item) {
            final isSelected = item['title'] == selectedLicenseType;
            return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                side: isSelected
                    ? const BorderSide(color: Colors.lightBlue, width: 2)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              color: isSelected ? Colors.lightBlue.shade50 : Colors.white,
              child: ListTile(
                leading: const Icon(Icons.motorcycle, color: Colors.green),
                title: Text(item['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(item['description']!),
                onTap: () async {
                  await _saveSelectedLicense(item['title']!);
                  setState(() {
                    selectedLicenseType = item['title']!;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
              ),
            );
          }),
          const SizedBox(height: 16),
          const Text(
            'PHIÊN BẢN ỨNG DỤNG: 4.1.0',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
