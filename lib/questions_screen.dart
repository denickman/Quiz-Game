import 'package:flutter/material.dart';

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
   return Text('Questions screen');
  }

}