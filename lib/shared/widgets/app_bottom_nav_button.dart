import 'package:flutter/material.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/utils/responsive.dart';
import 'package:roqqu_assesement/shared/widgets/gradient_button.dart';

class AppBottomNavButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Responsive responsive;

  const AppBottomNavButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.responsive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(responsive.width(16)),
      decoration: BoxDecoration(color: AppColors.bgSecondary),
      child: SafeArea(
        child: GradientButton(
          text: text,
          width: double.infinity,
          height: responsive.height(48),
          onTap: onTap,
        ),
      ),
    );
  }
}
