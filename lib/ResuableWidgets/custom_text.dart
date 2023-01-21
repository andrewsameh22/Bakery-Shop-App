import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight weight;
  Color textColor;
  TextAlign textAlign;

  CustomText(
      {Key? key,
      required this.text,
      this.weight = FontWeight.normal,
      this.textColor = Colors.white,
      this.fontSize = 18,
      this.textAlign = TextAlign.start})
      : super(key: key);

  //custom text field with poppins text style
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontWeight: weight,
        fontSize: fontSize,
      ),
    );
  }
}
