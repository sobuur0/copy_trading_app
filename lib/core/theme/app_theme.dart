import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.bgPrimary,
      scaffoldBackgroundColor: AppColors.bgPrimary,
      useMaterial3: true,
      fontFamily: GoogleFonts.inter().fontFamily,
    );
  }
}
