import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return 
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //you can wrap this widget inside an opacity widget and add opacity value by yourself or do this ->
            //child-1
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 150,
              color: const Color.fromARGB(131, 255, 255, 255),
              //so you can actually add color on an image and also make it transparent if neccesary
            ),

            //child-2
            const SizedBox(height: 30),

            //child-3
            const Text(
              "Learn Flutter the fun way",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            //child-4
            const SizedBox(height: 30),

            //child-5
            OutlinedButton.icon(
              onPressed: startQuiz,
              icon: const Icon(Icons.arrow_right_alt, color: Colors.white,),
              label: const Text(
                'Start Quiz',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
  }
}
