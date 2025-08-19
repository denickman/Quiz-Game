import 'package:flutter/material.dart';
import 'package:second_app/answer_button.dart';
import 'package:second_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QeustionsScreenState();
  }
}

class _QeustionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex ++;
    });
  }


  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[currentQuestionIndex]; // acces to the first element in list
    return SizedBox(
      // alternitive to Center - wrapper
      width: double
          .infinity, // use as much width as you can, be as wide as possible
      child: Container(
        margin: const EdgeInsets.all(30), // space between and  elements 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // items inside stretch out to be as wide as possible
          children: [
            Text(
              currentQuestion.text,
               style: TextStyle(color: Colors.white),
               textAlign: TextAlign.center,

              ),
        
            SizedBox(height: 30),
        
        
        // .map() возвращает Iterable<Widget>, то есть список виджетов, но сам по себе это не Widget.
        // А children: [] у Column требует список именно Widget, а не Iterable.
        // ... - spread operator разворачивает элементы Iterable прямо внутрь списка:
            ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                  answerText: answer, 
                  onTap: answerQuestion);
            }),
          ],
        ),
      ),
    );
  }
}
