import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_users/provider/theme_provider.dart';
import 'package:shop_users/widget/subtitle_text.dart';
import 'package:shop_users/widget/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SubTitleTextWidget(textDecoration: TextDecoration.underline,
              lable: "hello",
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.red),
              TitlesTextWidget(lable: "This is a title "*10),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Hello world"),
          ),
          SwitchListTile(
            title:
                Text(themeProvider.getIsDarkTheme ? "Light mode" : " Dark mode"),
            value: themeProvider.getIsDarkTheme,
            onChanged: (value) {
              themeProvider.setDarkTheme(themeValue: value);
            },
          ),
        ],
      ),
    );
  }
}
