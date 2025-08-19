import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  // init
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  // Map = Dictionary
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      // for adding value to Map you have to use {}
      summary.add({
        'question_index': i, // 0,1,2,...6
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  // build
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numOfTotalQuestions = questions.length;
    final numOfCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numOfCorrectQuestions out of $numOfTotalQuestions questions correctly!'),
            const SizedBox(height: 30),

            QuestionsSummary(summaryData),

            const SizedBox(height: 30),

            TextButton(onPressed: () {}, child: const Text("Restart Quiz")),
          ],
        ),
      ),
    );
  }
}
