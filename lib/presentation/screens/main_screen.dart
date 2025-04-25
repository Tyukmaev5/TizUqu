// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tizuqu/presentation/bloc/widgets/open_file.dart';
import 'package:tizuqu/presentation/screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TizUqu')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Ввести текст'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TextInputScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Открыть файл'),
              onPressed: () async {
                const OpenFileButton();
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Настройки'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
