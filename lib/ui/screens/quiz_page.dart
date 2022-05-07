import 'package:flutter/material.dart';
import 'package:myapp/constants/data_consts.dart';
import 'package:myapp/ui/screens/answer_button.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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
    return Scaffold(
        appBar: AppBar(
          title: const Text(DataConsts.quizTitle),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(DataConsts.question),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(_colors[0])),
                  onPressed: () {
                    _checkIfCorrect(0);
                  },
                  child: AnswerButton(
                    buttonText: "123",
                  )),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(_colors[1])),
                  onPressed: () {
                    _checkIfCorrect(1);
                  },
                  child: AnswerButton(
                    buttonText: "123",
                  )),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(_colors[2])),
                  onPressed: () {
                    _checkIfCorrect(2);
                  },
                  child: AnswerButton(
                    buttonText: "123",
                  )),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(_colors[3])),
                  onPressed: () {
                    _checkIfCorrect(3);
                  },
                  child: AnswerButton(
                    buttonText: "123",
                  )),
            ],
          )),
        ));
  }
}
