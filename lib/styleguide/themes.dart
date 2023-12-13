import 'package:flutter/material.dart';
import 'package:sports_events_app/styleguide/colors.dart';

class SportThemes {
  static ThemeData light = themeDataLight;
  static ThemeData dark = themeDataDark;

  static ThemeData getCurrentTheme(BuildContext context) =>
      MediaQuery.of(context).platformBrightness == Brightness.light ? SportThemes.light : SportThemes.dark;
}

ThemeData themeDataLight = ThemeData(
  fontFamily: 'Inter',
  colorScheme: SportColors.colorSchemeLight,
  scaffoldBackgroundColor: SportColors.colorSchemeLight.background,
  useMaterial3: true,
);

ThemeData themeDataDark = ThemeData(
  fontFamily: 'Inter',
  colorScheme: SportColors.colorSchemeDark,
  scaffoldBackgroundColor: SportColors.colorSchemeDark.background,
  useMaterial3: true,
);
