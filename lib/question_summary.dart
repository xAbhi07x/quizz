import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final userAnswer = data['user_answer'] as String;
            final correctAnswer = data['correct_answer'] as String;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  width: 30, // Adjust the width as needed
                  height: 30, // Adjust the height as needed to make it circular
                  padding: const EdgeInsets.all(4), // Adjust padding as needed
                  decoration: BoxDecoration(
                    color: userAnswer == correctAnswer
                        ? Colors.blue
                        : const Color.fromARGB(255, 234, 75, 128),
                    borderRadius: BorderRadius.circular(
                        15), // Set half of the width or height to make it circular
                  ),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                Expanded(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato( 
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(color: Color.fromARGB(255, 201, 84, 123)),
                      ),
                      Text(data['correct_answer'] as String, style: const TextStyle(color: Colors.blue),)
                    ],
                  ),
                )

              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
