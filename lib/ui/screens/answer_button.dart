import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  String buttonText;
  AnswerButton({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(buttonText),
        ));
  }
}
