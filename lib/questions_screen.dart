import 'package:flutter/material.dart';
import 'package:second_app/answer_button.dart';

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
    return SizedBox(
      // alternitive to Center - wrapper
      width: double
          .infinity, // use as much width as you can, be as wide as possible
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('The question...', style: TextStyle(color: Colors.white)),

          SizedBox(height: 30),

          AnswerButton(answerText: "answer text...", onTap: () {}),
        ],
      ),
    );
  }
}
