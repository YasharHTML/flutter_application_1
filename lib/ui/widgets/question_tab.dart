import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/models/reponses/monument_response.dart';
import 'package:myapp/ui/screens/answer_button.dart';
import 'package:myapp/constants/data_consts.dart';

class QuestionTab extends StatefulWidget {
  QuestionTab({Key? key, required this.data}) : super(key: key);
  late MonumentPost data;
  @override
  State<QuestionTab> createState() => _QuestionTabState();
}

class _QuestionTabState extends State<QuestionTab> {
  List<bool> _selected = [false, false, false, false];
  int _correct = 1;
  bool _correctHit = false;
  List<Color> _colors = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
    Colors.transparent
  ];
  void _checkIfCorrect(int index) {
    setState(() {
      if (!_correctHit) {
        _selected[index] = true;
        _colors[index] = index == _correct - 1 ? Colors.green : Colors.red;
        if (index == _correct - 1) {
          _correctHit = true;
        }
      }
    });
    print(_selected);
  }

  @override
  Widget build(BuildContext context) {
    print((widget.data.answers[0]));
    return Container(margin: EdgeInsets.symmetric(vertical: 10),decoration: BoxDecoration(border: Border.all(color: Colors.black)), child: Column(children: [
      Text(widget.data.title),
      TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(_colors[0])),
          onPressed: () {
            _checkIfCorrect(0);
          },
          child: AnswerButton(
            buttonText: widget.data.correctAnswer,
          )),
      TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(_colors[1])),
          onPressed: () {
            _checkIfCorrect(1);
          },
          child: AnswerButton(
            buttonText: widget.data.answers[0],
          )),
      TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(_colors[2])),
          onPressed: () {
            _checkIfCorrect(2);
          },
          child: AnswerButton(
            buttonText: widget.data.answers[1],
          )),
      TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(_colors[3])),
          onPressed: () {
            _checkIfCorrect(3);
          },
          child: AnswerButton(
            buttonText: widget.data.answers[2],
          )),
    ]));
  }
}
