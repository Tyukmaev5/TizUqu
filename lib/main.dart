import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/service_locator.dart';
import 'presentation/bloc/bloc_settings.dart';
import 'presentation/screens.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const TizUquApp());
}

class TizUquApp extends StatelessWidget {
  const TizUquApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SettingsBloc>()..add(LoadSettings()),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final themeMode = state.themeMode == 'dark'
              ? ThemeMode.dark
              : ThemeMode.light;

          return MaterialApp(
            title: 'TizUqu',
            themeMode: themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const MainScreen(),
            debugShowCheckedModeBanner: false,
          ); 
        },
      ),
    );
  }
}