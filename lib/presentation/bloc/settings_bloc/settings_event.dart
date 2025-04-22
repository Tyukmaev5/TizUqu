import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  @override
  List<Object?> get props => [];
}

class LoadSettings extends SettingsEvent {}

class ChangeSpeed extends SettingsEvent {
  final int speed;
  const ChangeSpeed(this.speed);

  @override
  List<Object?> get props => [speed];
}

class ChangeFontSize extends SettingsEvent {
  final double fontSize;
  const ChangeFontSize(this.fontSize);

  @override
  List<Object?> get props => [fontSize];
}

class ChangeFontType extends SettingsEvent {
  final String fontType;
  const ChangeFontType(this.fontType);

  @override
  List<Object?> get props => [fontType];
}

class ChangeThemeMode extends SettingsEvent {
  final String themeMode;
  const ChangeThemeMode(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}