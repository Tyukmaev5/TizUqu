import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tizuqu/data/settings.dart';
import 'settings_event.dart';
import 'settings_state.dart'; 

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsLocalDataSource localDataSource;

  SettingsBloc(this.localDataSource) : super(SettingsState.initial()) {
    on<LoadSettings>(_onLoadSettings);
    on<ChangeSpeed>(_onChangeSpeed);
    on<ChangeFontSize>(_onChangeFontSize);
    on<ChangeFontType>(_onChangeFontType);
    on<ChangeThemeMode>(_onChangeThemeMode);
  }

  void _onLoadSettings(LoadSettings event, Emitter<SettingsState> emit) {
    emit(
      state.copyWith(
        speedMs: localDataSource.getSpeed(),
        fontSize: localDataSource.getFontSize(),
        fontType: localDataSource.getFontType(),
        themeMode: localDataSource.getThemeMode(),
      ),
    );
  }

  void _onChangeSpeed(ChangeSpeed event, Emitter<SettingsState> emit) {
    localDataSource.saveSpeed(event.speed);
    emit(state.copyWith(speedMs: event.speed));
  }

  void _onChangeFontSize(ChangeFontSize event, Emitter<SettingsState> emit) {
    localDataSource.saveFontSize(event.fontSize);
    emit(state.copyWith(fontSize: event.fontSize));
  }

  void _onChangeFontType(ChangeFontType event, Emitter<SettingsState> emit) {
    localDataSource.saveFontType(event.fontType);
    emit(state.copyWith(fontType: event.fontType));
  }

  void _onChangeThemeMode(ChangeThemeMode event, Emitter<SettingsState> emit) {
    localDataSource.saveThemeMode(event.themeMode);
    emit(state.copyWith(themeMode: event.themeMode));
  }
}
