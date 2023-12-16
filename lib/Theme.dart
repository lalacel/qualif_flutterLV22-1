import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;

  ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.white,
    secondaryHeaderColor: Color.fromARGB(255, 0,168,155),
    // accentColor: Color.fromARGB(255, 237,46,35),
  );

  ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.black,
    secondaryHeaderColor: Color.fromARGB(255, 0,168,155),
    // accentColor: Color.fromARGB(255, 237,46,35),
  );

  ThemeProvider({required bool isLight}) {
    _selectedTheme = isLight ? light : dark;
  }

  void changeTheme() {
    _selectedTheme = _selectedTheme == light ? dark : light;
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}