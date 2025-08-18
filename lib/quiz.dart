import 'package:flutter/material.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

// Alternative init 1
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreens);
  // }

  // Alternative init 2
  var activeScreen = 'start-screen'; // name it`s up to you

  void switchScreens() {
    setState(() { // re-execute build method
      activeScreen = 'questions-screen'; // name it`s up to you
    });
  }

  @override
  Widget build(BuildContext context) {

  // alternative 1
  // final screenWidget = activeScreen == 'start-screen' ? StartScreen(switchScreens) : const QuestionsScreen();

  // alternative 2
   Widget screenWidget = StartScreen(switchScreens);

   if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen();
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
}
