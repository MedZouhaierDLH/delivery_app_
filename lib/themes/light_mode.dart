import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.orange.shade50, // Light orange for background and cards
    primary: Colors.deepOrange.shade600, // Rich orange for main elements
    secondary: Colors.amber.shade400, // Bright amber for highlights and accents
    tertiary: Colors.white, // White for a clean, modern look
    inversePrimary: Colors.brown.shade600, // Earthy brown for subtle contrasts
  ),
);