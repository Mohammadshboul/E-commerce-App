import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const THEME_STATUS = "THEME_STATUS";
  bool _darkTheme = false;
  bool get getIsDarkTheme => _darkTheme;
  ThemeProvider() {
    getTheme();
  }
  Future<void> setDarkTheme({required bool themeValue}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(THEME_STATUS, themeValue);
    _darkTheme = themeValue;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _darkTheme = pref.getBool(THEME_STATUS) ?? false;
    notifyListeners();
    return _darkTheme;
  }
}
