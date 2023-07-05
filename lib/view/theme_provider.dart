import 'package:flutter/material.dart';

class AppThemeData {
  final Color primaryColor;
  final Color accentColor;
  final TextStyle textStyle;
  final String logoPath;
  final int maxToken;
  final int numCollectors;

  AppThemeData({
    required this.primaryColor,
    required this.accentColor,
    required this.textStyle,
    required this.logoPath,
    required this.maxToken,
    required this.numCollectors,
  });
}

final defaultTheme = AppThemeData(
  primaryColor: Colors.blue,
  accentColor: Colors.green,
  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  logoPath: 'assets/default_logo.png',
  maxToken: 500,
  numCollectors: 5,
);

class ThemeProvider with ChangeNotifier {
  AppThemeData _currentTheme = defaultTheme;

  AppThemeData get currentTheme => _currentTheme;

  void setTheme(AppThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}
