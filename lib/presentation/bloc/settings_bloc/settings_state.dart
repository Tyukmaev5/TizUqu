import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final int speedMs;
  final double fontSize;
  final String fontType;
  final String themeMode;

  const SettingsState({
    required this.speedMs,
    required this.fontSize,
    required this.fontType,
    required this.themeMode,
  });

  factory SettingsState.initial() => const SettingsState(
        speedMs: 500,
        fontSize: 24.0,
        fontType: 'sans',
        themeMode: 'light',
      );

  SettingsState copyWith({
    int? speedMs,
    double? fontSize,
    String? fontType,
    String? themeMode,
  }) {
    return SettingsState(
      speedMs: speedMs ?? this.speedMs,
      fontSize: fontSize ?? this.fontSize,
      fontType: fontType ?? this.fontType,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [speedMs, fontSize, fontType, themeMode];
}
