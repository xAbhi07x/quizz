//this will not be a widget hence there is nothing for this class to extend
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    //shuffling the copied list
    //chaining - calling a method on the result of another method
    //shuffle doesn't return anything though
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}