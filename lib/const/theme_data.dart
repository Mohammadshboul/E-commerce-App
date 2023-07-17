import 'package:flutter/material.dart';
import 'package:shop_users/const/app_colors.dart';

class Styles {
  static ThemeData themeData(
      {required isDarktheme, required BuildContext context}) {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: isDarktheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
        cardColor: isDarktheme
            ? const Color.fromARGB(255, 13, 6, 37)
            : AppColors.lightCardColor,
        brightness: isDarktheme ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: isDarktheme
              ? AppColors.darkScaffoldColor
              : AppColors.lightScaffoldColor,
              elevation: 0,
              centerTitle: false,
        ));
  }
}
