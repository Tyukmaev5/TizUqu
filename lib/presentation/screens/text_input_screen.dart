import 'package:flutter/material.dart';
import 'package:tizuqu/presentation/screens.dart'; 

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({super.key});

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  final TextEditingController _controller = TextEditingController();

  void _startReading() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ShowWordsScreen(text: text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Вставьте текст')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Введите текст для скорочтения...',
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _startReading,
              child: const Text('Начать'),
            )
          ],
        ),
      ),
    );
  }
}