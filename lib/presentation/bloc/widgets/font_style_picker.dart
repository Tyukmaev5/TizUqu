import 'package:flutter/material.dart';

class FontStylePicker extends StatelessWidget {
  final String selectedFont;
  final ValueChanged<String> onChanged;

  const FontStylePicker({
    super.key,
    required this.selectedFont,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Тип шрифта:'),
        DropdownButton<String>(
          value: selectedFont,
          items: const [
            DropdownMenuItem(value: 'sans', child: Text('Обычный')),
            DropdownMenuItem(value: 'mono', child: Text('Моноширинный')),
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
