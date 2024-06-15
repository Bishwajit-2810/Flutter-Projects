import 'package:dark_light_theme/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;
  ThemeData getThemeData() {
    return _themeData;
  }

  void setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightTheme) {
      setThemeData(darkTheme);
    } else {
      setThemeData(lightTheme);
    }
  }
}
