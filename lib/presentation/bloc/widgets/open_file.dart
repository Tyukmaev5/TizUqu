// ignore_for_file: use_build_context_synchronously

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tizuqu/presentation/bloc/bloc_settings.dart';
import 'package:tizuqu/presentation/bloc/show_words_cubit.dart';
import 'package:tizuqu/presentation/screens.dart';

class OpenFileButton extends StatefulWidget {
  const OpenFileButton({super.key});

  @override
  State<OpenFileButton> createState() => _OpenFileButtonState();
}

class _OpenFileButtonState extends State<OpenFileButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Открыть файл'),
      onPressed: () async {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['txt'],
        );

        if (!mounted) return;

        if (result != null && result.files.single.bytes != null) {
          final content = String.fromCharCodes(result.files.single.bytes!);
          final settings = context.read<SettingsBloc>().state;
          final speed = Duration(milliseconds: settings.speedMs);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (_) => ShowWordsCubit(
                  text: content,
                  speed: speed,
                ),
                child: const ShowWordsScreen(),
              ),
            ),
          );
        }
      },
    );
  }
}
