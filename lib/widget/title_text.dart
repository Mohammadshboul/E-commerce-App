import 'package:flutter/material.dart';

class TitlesTextWidget extends StatelessWidget {
  const TitlesTextWidget({
    super.key,
    required this.lable,
     this.fontSize=20,
    this.fontWeight,
    this.color, this.maxLines,
  });
  final String lable;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  @override
  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
