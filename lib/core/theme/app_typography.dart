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

  static TextStyle small({
    FontWeight fontWeight = FontWeight.w500,
    double fontSize = 14,
    Color? color,
    double? letterSpacing,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: 20 / 14,
      letterSpacing: letterSpacing ?? 0,
      color: color,
    );
  }

  static TextStyle textMedium({
    FontWeight fontWeight = FontWeight.w500,
    double fontSize = 16,
    Color? color,
    double? letterSpacing,
    double? lineHeight,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: 24 / fontSize,
      letterSpacing: letterSpacing ?? 0,
      color: color,
    );
  }

  static TextStyle headingMobileLarge({
    FontWeight fontWeight = FontWeight.w800,
    double fontSize = 32,
    Color? color,
    double? letterSpacing,
    double? lineHeight,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: (lineHeight ?? 40) / fontSize,
      letterSpacing: letterSpacing ?? 0,
      color: color,
    );
  }

  static TextStyle headingMobileSmall({
    FontWeight fontWeight = FontWeight.w700,
    double fontSize = 16,
    Color? color,
    double? letterSpacing,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: 24 / 16,
      letterSpacing: letterSpacing ?? 0,
      color: color,
    );
  }

  static TextStyle headingMobileExtraSmall({
    FontWeight fontWeight = FontWeight.w700,
    double? fontSize = 12,
    Color? color,
    double? letterSpacing,
    int? lineHeight,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: (lineHeight ?? 16) / (fontSize ?? 12),
      letterSpacing: letterSpacing ?? 0,
      color: color,
    );
  }

  static TextStyle xBold({
    FontWeight fontWeight = FontWeight.w800,
    double fontSize = 12,
    Color? color,
    double? letterSpacing,
    double? lineHeight,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: (lineHeight ?? 16) / 12,
      letterSpacing: letterSpacing ?? 0,
      color: color,
    );
  }
}
