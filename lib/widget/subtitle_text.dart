import 'package:flutter/material.dart';

class SubTitleTextWidget extends StatelessWidget {
  const SubTitleTextWidget(
      {super.key,
      required this.lable,
      this.fontSize=70,
      this.fontStyle=FontStyle.normal,
       this.fontWeight=FontWeight.normal,
      this.color,
      this.textDecoration=TextDecoration.none});
  final String lable;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle,
          decoration: textDecoration),
    );
  }
}
