import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle extraSmall({
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 12,
    Color? color,
    double? letterSpacing,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: 18 / 12,
      letterSpacing: letterSpacing ?? 0,
      color: color,
    );
  }
}
