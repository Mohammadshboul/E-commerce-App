import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_users/widget/subtitle_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.text,
    required this.fun,
    required this.imagePath,
  });
  final String imagePath, text;
  final void Function() fun;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: fun,
      leading: Image.asset(
        imagePath,
        height: 45,
      ),
      title: SubTitleTextWidget(lable: text),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
