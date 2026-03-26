import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color obsidianBlack = Color(0xFF0A0A0A);
  static const Color obsidianSurface = Color(0xFF1E1E1E);
  static const Color obsidianAccent = Color(0xFF7C4DFF);
  static const Color obsidianSecondary = Color(0xFFB388FF);
  static const Color softGrey = Color(0xFF8E8E93);
  static const Color starkWhite = Color(0xFFFFFFFF);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: obsidianAccent,
      scaffoldBackgroundColor: obsidianBlack,
      cardColor: obsidianSurface,
      useMaterial3: true,
      textTheme: GoogleFonts.outfitTextTheme(
        ThemeData.dark().textTheme.copyWith(
          displayLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: starkWhite,
          ),
          displayMedium: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: starkWhite,
          ),
          bodyLarge: const TextStyle(
            fontSize: 16,
            color: starkWhite,
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
            color: softGrey,
          ),
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: obsidianAccent,
        secondary: obsidianSecondary,
        surface: obsidianSurface,
        onPrimary: starkWhite,
        onSurface: starkWhite,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: obsidianAccent,
          foregroundColor: starkWhite,
          textStyle: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
