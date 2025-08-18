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
    return SizedBox(
      // alternitive to Center - wrapper
      width: double
          .infinity, // use as much width as you can, be as wide as possible
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('The question...'),
          SizedBox(height: 30),

          DefaultTextStyle(
            style: const TextStyle(fontSize: 18, color: Colors.blue),
            child: Column(
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Answer 1')),

                ElevatedButton(onPressed: () {}, child: const Text('Answer 2')),

                ElevatedButton(onPressed: () {}, child: const Text('Answer 3')),
              ],
            ),
          ),

          ElevatedButton(onPressed: () {}, child: const Text('Answer 1')),

          ElevatedButton(onPressed: () {}, child: const Text('Answer 2')),

          ElevatedButton(onPressed: () {}, child: const Text('Answer 3')),
        ],
      ),
    );
  }
}
