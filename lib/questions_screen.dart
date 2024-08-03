import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0; //accesing different questions

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++; // Move to the next question
      if (currentQuestionIndex >= questions.length) {
        // If all questions are answered, reset index to 0 or handle transition accordingly
        currentQuestionIndex = 0;
      }
    });
  }

  //build method is re-rendered again when setState is called
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          //mainAxisalignment is for vertical and cross one is for horizontal

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //the 'stretch' item will stretch out the items as much as possible

          //children only wants a list of widget
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 141, 78, 188),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            //converting a list of strings to list of widgets(AnswerButton),
            //the answer button is then pulled out and then added individually to the children
            //map doesn't change the original list and makes a copy but shuffle change the original list
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(item, () {
                answerQuestion(item);
              });
            })
          ],
        ),
      ),
    );
  }
}
