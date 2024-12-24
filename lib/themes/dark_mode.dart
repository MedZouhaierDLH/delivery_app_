import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
colorScheme: ColorScheme.dark(
surface: const Color.fromARGB(255, 30, 30, 30), // Slightly lighter dark for cards and surfaces
primary: const Color.fromARGB(255, 255, 140, 0), // Bright orange for primary elements
secondary: const Color.fromARGB(255, 255, 183, 77), // Soft amber for accents
tertiary: const Color.fromARGB(255, 50, 50, 50), // Dark grey for text fields or containers
inversePrimary: Colors.white, // White for inverse primary contrast
),
);