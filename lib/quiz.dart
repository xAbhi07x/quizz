import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/gradient_container.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/result_screen.dart';

//This class defines the Quiz widget as a StatefulWidget, indicating that it can maintain state that can change over time.
class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

//This private class _QuizState represents the state of the Quiz widget..........................
//leading underscore make things private be it class or a method
class _QuizState extends State<Quiz> {
  //active screen can also be null or widget
  // Widget? activeScreen;

  var activeScreen = 'start-screen';

  //initializing the selectedAnswers so that we can store the answers that are being selected
  List<String> selectedAnswers = [];

  //initstate executes after the object was created hence initially the activescreen must be null
  // @override
  // void initState() {
  //   activeScreen = GradientContainer(switchScreen);
  //   super.initState(); //this make sure that in parent class the init is executed as well, to allow aditional initialization
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  //the choose answers add the choosen answer on click by populating the selectedAnswer.
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    //initially setting the screen to starting screen
    Widget screenWidget = GradientContainer(switchScreen);

    //we are using if statements to switch screens
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget =
          ResultScreen(choosenAnswers: selectedAnswers, onRestart: onRestart);
    }

    return MaterialApp(
      //we want to use this Background everywhere
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 65, 26, 134),
                Color.fromARGB(255, 132, 84, 215),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
          ),
          child:
              screenWidget, //this screenwidget can be question-screen or starting-screen or result-screen
        ),
      ),
    );
  }
}
