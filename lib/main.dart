import 'package:flutter/material.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex == 2) {
      setState(() {
        _questionIndex = 0;
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var questions = [
      "What is your favorite color?",
      "What is your best friend's favorite color?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mehul's First Application"),
          backgroundColor: Color(0xFFFF0000),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]),
            RaisedButton(
              child: Text('Blue'),
              color: Color(0xFF0000FF),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Red'),
              color: Color(0xFFFF0000),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Green'),
              color: Color(0xFF008000),
              onPressed: _answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
