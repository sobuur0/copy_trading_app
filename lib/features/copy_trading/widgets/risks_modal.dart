import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';
import 'package:roqqu_assesement/core/utils/responsive.dart';
import 'package:roqqu_assesement/shared/widgets/gradient_button.dart';

class RisksModal extends StatefulWidget {
  const RisksModal({super.key});

  @override
  State<RisksModal> createState() => _RisksModalState();
}

class _RisksModalState extends State<RisksModal> {
  bool _isMarketRisksExpanded = false;

  final List<Map<String, String>> _risks = [
    {'title': 'Market risks', 'description': 'All investments carry risks, including potential loss of capital.'},
    {'title': 'Dependency on others', 'description': ''},
    {'title': 'Mismatched risk profiles', 'description': ''},
    {'title': 'Control and understanding', 'description': ''},
    {'title': 'Emotional decisions', 'description': ''},
    {'title': 'Costs involved', 'description': ''},
    {'title': 'Diversify', 'description': ''},
    {'title': 'Execution risks', 'description': ''},
  ];

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(responsive.width(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Risks',
                          style: AppTypography.headingMobileExtraSmall(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.width(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Risks involved in copy trading',
                              style: AppTypography.headingMobileLarge(
                                color: AppColors.textPrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: responsive.height(8)),
                            Text(
                              'Please make sure you read the following risks involved in copy trading before making a decision.',
                              style: AppTypography.extraSmall(
                                color: AppColors.textSecondary,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: responsive.height(24)),
                            ..._risks.map((risk) => _buildRiskItem(
                                  risk['title']!,
                                  risk['description']!,
                                  responsive,
                                )),
                            SizedBox(height: responsive.height(24)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(responsive.width(24)),
                    child: GradientButton(
                      text: 'I have read the risks',
                      width: double.infinity,
                      height: responsive.height(48),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRiskItem(String title, String description, Responsive responsive) {
    final isMarketRisks = title == 'Market risks';
    final isExpanded = isMarketRisks && _isMarketRisksExpanded;

    return Container(
      margin: EdgeInsets.only(bottom: responsive.height(12)),
      decoration: BoxDecoration(
        color: AppColors.bgPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: isMarketRisks
                ? () {
                    setState(() {
                      _isMarketRisksExpanded = !_isMarketRisksExpanded;
                    });
                  }
                : null,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: EdgeInsets.all(responsive.width(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTypography.headingMobileExtraSmall(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.textPrimary,
                    size: responsive.width(24),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded && description.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                left: responsive.width(16),
                right: responsive.width(16),
                bottom: responsive.width(16),
              ),
              child: Text(
                description,
                style: AppTypography.extraSmall(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
