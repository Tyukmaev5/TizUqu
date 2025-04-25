import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tizuqu/presentation/bloc/bloc_settings.dart';
import 'package:tizuqu/presentation/bloc/show_words/show_words_cubit.dart';
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
      final settings = context.read<SettingsBloc>().state;
      final speed = Duration(milliseconds: settings.speedMs);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => ShowWordsCubit(text: text, speed: speed),
            child: const ShowWordsScreen(),
          ),
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
