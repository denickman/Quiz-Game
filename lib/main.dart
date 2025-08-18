import 'package:flutter/material.dart';
import 'package:second_app/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: 
          LinearGradient(colors: 
          [
              Colors.deepPurple.shade400,
              Colors.deepPurple.shade300,
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade100
          ],  
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
          ),
          child: const StartScreen()
          ),
        ),
      ),
  );
}