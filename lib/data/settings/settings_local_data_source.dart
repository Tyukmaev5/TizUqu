import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalDataSource {
  final SharedPreferences prefs;

  SettingsLocalDataSource(this.prefs);

  int getSpeed() => prefs.getInt('speedMs') ?? 500;
  double getFontSize() => prefs.getDouble('fontSize') ?? 24.0;
  String getFontType() => prefs.getString('fontType') ?? 'sans';
  String getThemeMode() => prefs.getString('themeMode') ?? 'light';

  Future<void> saveSpeed(int speed) => prefs.setInt('speedMs', speed);
  Future<void> saveFontSize(double size) => prefs.setDouble('fontSize', size);
  Future<void> saveFontType(String font) => prefs.setString('fontType', font);
  Future<void> saveThemeMode(String mode) => prefs.setString('themeMode', mode);
}
