import 'package:flutter/material.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/start_screen.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  // Properties 

  // Alternative 1
  /*
  Widget? activeScreen;
  
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreens);
  }
  */

  // Alternative 2
  var activeScreen = 'start-screen'; // name it`s up to you

  // final modifier - cannot change the entire list but can modify the existed already
  List<String> _selectedAnswers = [];

  // Build

  @override
  Widget build(BuildContext context) {
    // alternative 1
    // final screenWidget = activeScreen == 'start-screen' ? StartScreen(switchScreens) : const QuestionsScreen();

    // alternative 2
    Widget screenWidget = StartScreen(switchScreens);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
        );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade400,
                Colors.deepPurple.shade300,
                Colors.deepPurple.shade200,
                Colors.deepPurple.shade100,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }


  // Methods 

   void switchScreens() {
    setState(() {
      // re-execute build method

      // Alternative 1
      //   activeScreen = StartScreen(switchScreens);

      // Alternative 2
      activeScreen = 'questions-screen'; // name it`s up to you
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    // if this a last question, show final screen
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      activeScreen = 'start-screen';
          });
  }
}


