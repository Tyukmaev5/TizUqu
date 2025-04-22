import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tizuqu/presentation/bloc/bloc_settings.dart'; 

class ShowWordsScreen extends StatefulWidget {
  final String text;
  const ShowWordsScreen({super.key, required this.text});

  @override
  State<ShowWordsScreen> createState() => _ShowWordsScreenState();
}

class _ShowWordsScreenState extends State<ShowWordsScreen> {
  late List<String> words;
  int index = 0;
  Timer? timer;
  int speedMs = 500;
  double fontSize = 24.0;
  String fontType = 'sans';

  @override
  void initState() {
    super.initState();
    words = widget.text.trim().split(RegExp(r'\s+'));

    // Получаем текущие настройки из BLoC при старте
    final settings = context.read<SettingsBloc>().state;
    speedMs = settings.speedMs;
    fontSize = settings.fontSize;
    fontType = settings.fontType;

    _startReading();
  }

  void _startReading() {
    timer = Timer.periodic(Duration(milliseconds: speedMs), (timer) {
      if (index < words.length - 1) {
        setState(() => index++);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  TextStyle _getTextStyle() {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontType == 'mono' ? 'monospace' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Чтение')),
      body: Center(
        child: Text(
          words[index],
          style: _getTextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}