import 'package:flutter/material.dart';

class ThemeModePicker extends StatelessWidget {
  final String selectedMode;
  final ValueChanged<String> onChanged;

  const ThemeModePicker({
    super.key,
    required this.selectedMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Тема:'),
        DropdownButton<String>(
          value: selectedMode,
          items: const [
            DropdownMenuItem(value: 'light', child: Text('Светлая')),
            DropdownMenuItem(value: 'dark', child: Text('Тёмная')),
            DropdownMenuItem(value: 'custom', child: Text('Кастомная')),
          ],
          onChanged: (String? value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
      ],
    );
  }
}
