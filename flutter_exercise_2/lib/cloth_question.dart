import 'package:flutter/material.dart';


class ClothQuestion extends StatelessWidget {

  String _questionContent;

  ClothQuestion(this._questionContent);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // ignore: prefer_const_constructors
      margin: EdgeInsets.all(5),
      child: Text(
        _questionContent,
        textAlign: TextAlign.center,
        // ignore: prefer_const_constructors
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );
  }
}
