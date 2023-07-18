import 'package:flutter/material.dart';
import 'package:shop_users/widget/subtitle_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SubTitleTextWidget(
              textDecoration: TextDecoration.underline,
              lable: "hello",
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.red),
          
        ],
      ),
    );
  }
}
