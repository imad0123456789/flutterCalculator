
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {

  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalculatorButton({
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.textSize,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(fillColor),
          ),
          onPressed: ()  => callback(text),
          child: Text(
            text,
            style: TextStyle(
              color: Color(textColor),
              fontSize: textSize, // of buttons
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
      ),
    );
  }
}
