import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswers, required this.onRestart});

  final List<String> choosenAnswers;
  final void Function() onRestart;
 
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;

    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'] ? true : false;
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions question correctly!',
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 142, 74, 95),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: onRestart,
                icon: const Icon(Icons.refresh_rounded, color: Colors.white,),
                label: const Text(
                  'Retry Quiz',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
