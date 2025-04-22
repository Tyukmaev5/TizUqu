import 'package:flutter/material.dart';

class FontSizePicker extends StatelessWidget {
  final double fontSize;
  final ValueChanged<double> onChanged;

  const FontSizePicker({
    super.key,
    required this.fontSize,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Размер шрифта:'),
        Slider(
          min: 12.0,
          max: 60.0,
          divisions: 12,
          value: fontSize,
          label: '${fontSize.toInt()}',
          onChanged: onChanged,
        ),
      ],
    );
  }
}
