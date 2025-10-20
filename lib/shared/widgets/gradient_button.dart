import 'package:flutter/material.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final bool isEnabled;

  const GradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1.0 : 0.5,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: AppColors.getStartedButtonGradient,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: isEnabled ? onTap : null,
            child: Center(
              child: Text(
                text,
                style: AppTypography.headingMobileExtraSmall(
                  color: Colors.white,
                  fontSize: 16,
                  lineHeight: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
