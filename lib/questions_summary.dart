import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          300, // if child Column is bigger than 300 px it will be cut off of screen
      child: SingleChildScrollView(
        // it makes its child scrollable
        child: Column(
          children: summaryData.map((infoData) {
            return Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // прижать детей к верху
              children: [
                // для людей лучше чтобы начиналось с 1 а не с 0
                // здесь нужно кастить значения с Map (dictiionary) вручную
                CircleAvatar(
                  radius: 12,
                  backgroundColor: (infoData['user_answer'] == infoData['correct_answer']) ? Colors.lightBlue : Colors.red,
                  child: Text(
                    ((infoData['question_index'] as int) + 1).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  // Expanded - "Этот ребёнок должен занять всё доступное свободное пространство по главной оси."
                  // У Row главная ось = горизонталь.
                  // У Column главная ось = вертикаль.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // чтобы тексты внутри колонки были слева
                    children: [ 
                      Text(
                        infoData['question'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),

                      const SizedBox(height: 5),
                      Text(
                        infoData['user_answer'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.deepPurple.shade400,
                        ),
                        textAlign: TextAlign.left,
                      ), // selected answer
                      Text(
                        infoData['correct_answer'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueAccent.shade700,
                        ),
                        textAlign: TextAlign.left,
                      ), // correct answer
                    ],
                  ),
                ),
                 const SizedBox(height: 40),
              ],

            );
          }).toList(),
          // .map() = превращает элементы в другую форму, но возвращает Iterable. (1,2,3)
          // .toList() = делает из этого Iterable обычный List, который и нужен children:. [1, 2, 3]
        ),
      ),
    );
  }
}
