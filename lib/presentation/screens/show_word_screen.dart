import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/bloc/show_words/show_words_cubit.dart';
import '../../../presentation/bloc/show_words/show_words_state.dart';

class ShowWordsScreen extends StatelessWidget {
  const ShowWordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Скорочтение')),
      body: SafeArea(
        child: BlocBuilder<ShowWordsCubit, ShowWordsState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Слово по центру
                Expanded(
                  child: Center(
                    child: Text(
                      state.currentWord,
                      style: const TextStyle(fontSize: 48),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // Прогресс
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: LinearProgressIndicator(
                    value: state.progress,
                    backgroundColor: Colors.grey[300],
                    color: Theme.of(context).primaryColor,
                  ),
                ),

                const SizedBox(height: 24),

                // Кнопки управления
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () =>
                          context.read<ShowWordsCubit>().previous(),
                      icon: const Icon(Icons.skip_previous),
                      iconSize: 36,
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () {
                        if (state.isPlaying) {
                          context.read<ShowWordsCubit>().pause();
                        } else {
                          context.read<ShowWordsCubit>().play();
                        }
                      },
                      icon: Icon(
                          state.isPlaying ? Icons.pause : Icons.play_arrow),
                      iconSize: 48,
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () => context.read<ShowWordsCubit>().next(),
                      icon: const Icon(Icons.skip_next),
                      iconSize: 36,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            );
          },
        ),
      ),
    );
  }
}
