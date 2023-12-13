import 'package:flutter/material.dart';

class SportColors {
  static ColorScheme colorSchemeLight = const ColorScheme.light(
    primary: Color(0xFF000000),
    onPrimary: Colors.white,
    onPrimaryContainer: Color(0xFF565F69),
    secondary: Color(0xFFE7F4F8),
    onSecondary: Colors.black,
    brightness: Brightness.light,
  );

  static ColorScheme colorSchemeDark = const ColorScheme.dark(
    primary: Color(0xFFE7F4F8),
    onPrimary: Colors.black,
    onPrimaryContainer: Color(0xFF565F69),
    secondary: Color(0xFF000000),
    onSecondary: Colors.white,
    brightness: Brightness.dark,
  );
}
