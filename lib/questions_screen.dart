import 'package:flutter/material.dart';
import 'package:second_app/answer_button.dart';
import 'package:second_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QeustionsScreenState();
  }
}

class _QeustionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    /*
    🔹 Что такое widget внутри _QuestionsScreenState

      В классе _QuestionsScreenState у тебя нет прямого доступа к полям QuestionsScreen
      (например, к onSelectAnswer).
      Flutter специально даёт ссылку на родительский StatefulWidget через свойство widget.

      То есть:
      widget → это объект QuestionsScreen, который сейчас отрисован.
      Соответственно, widget.onSelectAnswer → это обращение к параметру, 
      который ты передал в QuestionsScreen при создании.
    */
    widget.onSelectAnswer(selectedAnswer);
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
               // style: TextStyle(color: Colors.white),
               style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
               ),
               textAlign: TextAlign.center,

              ),
        
            SizedBox(height: 30),
        
        
        // .map() возвращает Iterable<Widget>, то есть список виджетов, но сам по себе это не Widget.
        // А children: [] у Column требует список именно Widget, а не Iterable.
        // ... - spread operator разворачивает элементы Iterable прямо внутрь списка:
            ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                  answerText: answer, 
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
