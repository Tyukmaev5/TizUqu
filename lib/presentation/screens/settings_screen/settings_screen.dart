import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tizuqu/presentation/bloc/bloc_settings.dart';
import 'package:tizuqu/presentation/bloc/widgets.dart';  

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('Скорость (мс):'),
              Slider(
                min: 100,
                max: 2000,
                divisions: 19,
                value: state.speedMs.toDouble(),
                label: '${state.speedMs} мс',
                onChanged: (value) {
                  context.read<SettingsBloc>().add(ChangeSpeed(value.toInt()));
                },
              ),
              const SizedBox(height: 20),
              FontSizePicker(
                fontSize: state.fontSize,
                onChanged: (size) {
                  context.read<SettingsBloc>().add(ChangeFontSize(size));
                },
              ),
              const SizedBox(height: 20),
              ThemeModePicker(
                selectedMode: state.themeMode,
                onChanged: (mode) {
                  context.read<SettingsBloc>().add(ChangeThemeMode(mode));
                },
              ),
              const SizedBox(height: 20),
              FontStylePicker(
                selectedFont: state.fontType,
                onChanged: (font) {
                  context.read<SettingsBloc>().add(ChangeFontType(font));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
