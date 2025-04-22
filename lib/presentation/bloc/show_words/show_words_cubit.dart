import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'show_words_state.dart';

class ShowWordsCubit extends Cubit<ShowWordsState> {
  Timer? _timer;

  ShowWordsCubit({required String text, required Duration speed})
      : super(
          ShowWordsState(
            words: text.split(RegExp(r'\s+')),
            currentIndex: 0,
            isPlaying: false,
            speed: speed,
          ),
        );

  void play() {
    if (state.isPlaying) return;
    emit(state.copyWith(isPlaying: true));
    _timer = Timer.periodic(state.speed, (_) => _tick());
  }

  void pause() {
    emit(state.copyWith(isPlaying: false));
    _timer?.cancel();
  }

  void _tick() {
    if (state.currentIndex < state.words.length - 1) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    } else {
      pause(); // остановка в конце
    }
  }

  void next() {
    if (state.currentIndex < state.words.length - 1) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    }
  }

  void previous() {
    if (state.currentIndex > 0) {
      emit(state.copyWith(currentIndex: state.currentIndex - 1));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
