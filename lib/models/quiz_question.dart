class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getshuffled() {
    final shuffledlist = List.of(answers);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}
