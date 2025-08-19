import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {

const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
   return SizedBox(
    height: 300, // if child Column is bigger than 300 px it will be cut off of screen
     child: SingleChildScrollView( // it makes its child scrollable 
       child: Column(children: 
        summaryData.map((infoData) {
            return Row(children: [
              // для людей лучше чтобы начиналось с 1 а не с 0 
              // здесь нужно кастить значения с Map (dictiionary) вручную
                Text(((infoData['question_index'] as int) + 1).toString()), 
       
                Expanded( 
                  // Expanded - "Этот ребёнок должен занять всё доступное свободное пространство по главной оси."
                  // У Row главная ось = горизонталь.
                  // У Column главная ось = вертикаль.
                  child: Column(children: [
                    Text(infoData['question'] as String),
                    const SizedBox(height: 5),
                    Text(infoData['user_answer'] as String), // selected answer 
                    Text(infoData['correct_answer'] as String), // correct answer 
                  ]),
                ),
       
       
            ]);
        }).toList(),
        // .map() = превращает элементы в другую форму, но возвращает Iterable. (1,2,3)
        // .toList() = делает из этого Iterable обычный List, который и нужен children:. [1, 2, 3]
       ),
     ),
   );
  }
}