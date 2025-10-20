import 'package:flutter/material.dart';

class DashboardCardData {
  final String title;
  final String subtitle;
  final String iconPath;
  final List<Color> gradientColors;

  DashboardCardData({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.gradientColors,
  });
}
