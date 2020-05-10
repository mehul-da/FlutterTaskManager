import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;

  Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:18, bottom:10),
      width: double.infinity,
      child: Text(
        question,
        style: TextStyle(fontSize: 23, fontFamily: "Arial"),
        textAlign: TextAlign.center,
      ),
    );
  }
}
