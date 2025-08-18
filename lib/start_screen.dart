import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {

  // если в классе нет const конструктора, ты вообще не сможешь написать const StartScreen().
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return const Text('Start screen');
  }

}