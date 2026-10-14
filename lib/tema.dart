import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const ink = Color(0xFF1B2B3A);
  static const paper = Color(0xFFEDF1F4);
  static const lens = Color(0xFFF2A33A);
  static const evidence = Color(0xFFC8553D);
  static const teal = Color(0xFF2A7F8E);
  static const success = Color(0xFF3C9D6B);
}

ThemeData buildTheme() {
  final base = ColorScheme.fromSeed(
    seedColor: AppColors.teal,
    primary: AppColors.ink,
    secondary: AppColors.lens,
    surface: Colors.white,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: base,
    scaffoldBackgroundColor: AppColors.paper,
    textTheme: GoogleFonts.spaceGroteskTextTheme().apply(
      bodyColor: AppColors.ink,
      displayColor: AppColors.ink,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.ink,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.lens,
        foregroundColor: AppColors.ink,
        minimumSize: const Size.fromHeight(52),
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
