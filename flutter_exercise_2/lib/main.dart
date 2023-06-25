import 'package:flutter/material.dart';
import 'package:flutter_exercise_2/cloth_answer.dart';
import 'cloth_question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void _iWasTapped() {
    setState(() {
      _questionIndex += 1;
    });

    print("i was tapped");
  }

  var questions = [
    {
      'question': 'Select cloth size',
      'answer': ['XS', 'S', 'M', 'L', 'XL']
    },
    {
      'question': 'Select cloth season type',
      'answer': ['Winter', 'Summer']
    },
    {
      'question': 'Select cloth type:',
      'answer': ['T-Shirt', 'Pajamas']
    },
  ];
  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exercise 2 - Cloth App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World"),
        ),
        body: Column(
          children: [
            ClothQuestion(questions[_questionIndex]['question'] as String),
            ...(questions[_questionIndex]['answer'] as List<String>).map((answer) {
              return ClothAnswer(_iWasTapped, answer);
            }),
          ],
        ),
      ),
    );
  }
}
