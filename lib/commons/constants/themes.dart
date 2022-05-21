import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemeData {
  final TTTColors colors = TTTColors();

  ThemeData get themeData {
    return ThemeData(
      primaryColor: colors.primary,
      fontFamily: 'Heebo',
      scaffoldBackgroundColor: colors.background,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: colors.primary,
        secondary: colors.secondary,
        tertiary: colors.terciary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colors.primary),
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            colors.primary,
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
