import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentation/bloc/settings_bloc/settings_bloc.dart';
import '../data/settings/settings_local_data_source.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);
  sl.registerLazySingleton(() => SettingsLocalDataSource(sl()));
  sl.registerFactory(() => SettingsBloc(sl()));
}