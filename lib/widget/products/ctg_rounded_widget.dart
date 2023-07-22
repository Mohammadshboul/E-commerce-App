import 'package:flutter/material.dart';
import 'package:shop_users/widget/subtitle_text.dart';

class CategoryRoundedWidget extends StatelessWidget {
  const CategoryRoundedWidget(
      {super.key, required this.image, required this.name});
  final String image, name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 50,
          height: 50,
        ),
        const SizedBox(
          height: 15,
        ),
        SubTitleTextWidget(
          lable: name,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        )
      ],
    );
  }
}
