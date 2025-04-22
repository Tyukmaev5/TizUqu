class WordSplitter {
  List<String> split(String text) {
    return text.trim().split(RegExp(r'\s+'));
  }
}
