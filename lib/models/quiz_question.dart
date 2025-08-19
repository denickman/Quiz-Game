
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  
  final String text;
  final List<String> answers;

// Options #1 - Method
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); 
    // create a copy because we do not interfere with 
    // the original answers and store in final shuffledList 
    shuffledList.shuffle(); // shuffle 
    return shuffledList;
  }

  // Options #1 - Get Property
  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}