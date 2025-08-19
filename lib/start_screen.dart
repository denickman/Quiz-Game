import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  // если в классе нет const конструктора, ты вообще не сможешь написать const StartScreen().
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz; // то же, что VoidCallback

  @override
  Widget build(BuildContext context) {
    // Center по умолчанию занимает всё доступное пространство (то есть весь размер родителя),
    // а уже внутри центрует своего потомка (Text).
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // “Не растягивайся на весь экран по вертикали, а занимай только столько места, сколько нужно детям (Image)”.

        children: [
          /*
          // Option #1 
          // Opacity - is quite performance intenise widget, should avoid it if you can
          Opacity(
            opacity: 0.6,
            child: Image.asset('assets/images/quiz-logo.png', width: 300),
            ),
          */

          // Option #2
          Image.asset('assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(149, 255, 255, 255),
          ),

          // Image.asset() нельзя сделать const. он создаёт Image динамически
          const SizedBox(height: 80),

          Text('Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: Colors.amber.shade800, 
              fontSize: 24
              ),

            /*
            style: TextStyle(
              color: Colors
                  .white, // Colors.white — это готовая константа в классе Colors.
              // color: Colors.amber.shade800,
              /*
          Colors.amber — это MaterialColor, который внутри хранит карту оттенков (Map<int, Color>).
          Когда ты пишешь .shade800, это геттер, который возвращает значение из этой карты во время 
          выполнения (runtime).     
          Colors.amber.shade800 нельзя вычислить на этапе компиляции, потому что это не const
          */
              fontSize: 24,
            ),
*/
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            // option #1
            // onPressed: () {
            //     startQuiz();
            // }, // onPressed: () {} не может быть const/ нельзя написать const OutlinedButton

            // option #2
            onPressed: startQuiz,

            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
