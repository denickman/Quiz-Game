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
  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[0]; // acces to the first element in list

    return SizedBox(
      // alternitive to Center - wrapper
      width: double
          .infinity, // use as much width as you can, be as wide as possible
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQuestion.text, style: TextStyle(color: Colors.white)),

          SizedBox(height: 30),

          AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
          AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
          AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
          AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
        ],
      ),
    );
  }
}
