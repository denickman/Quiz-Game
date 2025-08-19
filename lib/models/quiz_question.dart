
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); 
    // create a copy because we do not interfere with 
    // the original answers and store in final shuffledList 
    shuffledList.shuffle(); // shuffle 
    return shuffledList;
  }
}