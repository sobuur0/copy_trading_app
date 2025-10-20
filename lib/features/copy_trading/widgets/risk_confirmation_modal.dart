import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:roqqu_assesement/core/constants/app_assets.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';
import 'package:roqqu_assesement/core/utils/responsive.dart';
import 'package:roqqu_assesement/shared/widgets/gradient_button.dart';
import 'package:roqqu_assesement/features/copy_trading/widgets/risks_modal.dart';

class RiskConfirmationModal extends StatefulWidget {
  const RiskConfirmationModal({super.key});

  @override
  State<RiskConfirmationModal> createState() => _RiskConfirmationModalState();
}

class _RiskConfirmationModalState extends State<RiskConfirmationModal> {
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final responsive = Responsive(constraints);

        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.bgSecondary,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(responsive.width(24)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          color: AppColors.textPrimary,
                          size: responsive.width(24),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: responsive.height(16)),
                  Image.asset(
                    AppAssets.importantMessage,
                    width: responsive.width(200),
                    height: responsive.height(150),
                  ),
                  SizedBox(height: responsive.height(24)),
                  Text(
                    'Important message!',
                    style: AppTypography.headingMobileLarge(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: responsive.height(16)),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTypography.extraSmall(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text:
                              "Don't invest unless you're prepared and understand the risks involved in copy trading.\n",
                        ),
                        TextSpan(
                          text: 'Learn more',
                          style: AppTypography.extraSmall(
                            color: AppColors.fgLink,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(text: ' about the risks.'),
                      ],
                    ),
                  ),
                  SizedBox(height: responsive.height(32)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isAgreed = !_isAgreed;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: responsive.width(20),
                          height: responsive.width(20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _isAgreed
                                  ? AppColors.fgLink
                                  : AppColors.bgBorder,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                            color: _isAgreed
                                ? AppColors.fgLink
                                : Colors.transparent,
                          ),
                          child: _isAgreed
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: responsive.width(14),
                                )
                              : null,
                        ),
                        SizedBox(width: responsive.width(12)),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              style: AppTypography.extraSmall(
                                color: AppColors.textSecondary,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "Check this box to agree to Roqqu's copy trading ",
                                ),
                                TextSpan(
                                  text: 'policy',
                                  style: AppTypography.extraSmall(
                                    color: AppColors.fgLink,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: responsive.height(32)),
                  GradientButton(
                    text: 'Proceed to copy trade',
                    width: double.infinity,
                    height: responsive.height(48),
                    isEnabled: _isAgreed,
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.black.withOpacity(0.5),
                        isScrollControlled: true,
                        builder: (context) => const RisksModal(),
                      );
                    },
                  ),
                  SizedBox(height: responsive.height(16)),
                ],
              ),
            ),
            ),
          ),
        );
      },
    );
  }
}
