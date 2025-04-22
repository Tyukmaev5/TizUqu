class ShowWordsState {
  final List<String> words;
  final int currentIndex;
  final bool isPlaying;
  final Duration speed;

  ShowWordsState({
    required this.words,
    required this.currentIndex,
    required this.isPlaying,
    required this.speed,
  });

  String get currentWord => words[currentIndex];

  double get progress => words.isEmpty ? 0 : currentIndex / (words.length - 1);

  ShowWordsState copyWith({
    List<String>? words,
    int? currentIndex,
    bool? isPlaying,
    Duration? speed,
  }) {
    return ShowWordsState(
      words: words ?? this.words,
      currentIndex: currentIndex ?? this.currentIndex,
      isPlaying: isPlaying ?? this.isPlaying,
      speed: speed ?? this.speed,
    );
  }
}
