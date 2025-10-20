import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assesement/core/constants/app_assets.dart';
import 'package:roqqu_assesement/core/constants/app_routes.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';
import 'package:roqqu_assesement/core/utils/responsive.dart';

class MoreForYouWidget extends StatelessWidget {
  final VoidCallback onNavigate;

  const MoreForYouWidget({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraint) {
        final responsive = Responsive(contraint);

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.width(16),
            vertical: responsive.height(12),
          ),
          margin: EdgeInsets.only(
            left: responsive.width(16),
            right: responsive.width(16),
          ),
          width: double.infinity,
          height: responsive.height(750),
          decoration: BoxDecoration(
            color: AppColors.bgSecondary,
            borderRadius: BorderRadius.circular(24),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: responsive.height(12)),
                Text(
                  'Trade',
                  style: AppTypography.headingMobileExtraSmall(
                    fontSize: 14,
                    lineHeight: 24,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: responsive.height(8)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.bgSecondary,
                    border: Border.all(color: AppColors.bgBorder, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff323247).withValues(alpha: .05),
                        blurRadius: 8,
                        offset: Offset(0, 3),
                        spreadRadius: -1,
                      ),
                      BoxShadow(
                        color: Color(0xff0C1A4B).withValues(alpha: .24),
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: _buildListWithSeparators([
                      'Buy',
                      'Sell',
                      'Swap',
                      'Send',
                      'Receive',
                      'Invest',
                    ]),
                  ),
                ),

                SizedBox(height: responsive.height(24)),

                Text(
                  'Earn',
                  style: AppTypography.headingMobileExtraSmall(
                    fontSize: 14,
                    lineHeight: 24,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: responsive.height(8)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.bgSecondary,
                    border: Border.all(color: AppColors.bgBorder, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff323247).withValues(alpha: .05),
                        blurRadius: 8,
                        offset: Offset(0, 3),
                        spreadRadius: -1,
                      ),
                      BoxShadow(
                        color: Color(0xff0C1A4B).withValues(alpha: .24),
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: _buildListWithSeparators([
                      'Roqq\'n\'roll',
                      'Savings',
                      'Missions',
                      'Receive',
                      'Copy trading',
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildListWithSeparators(List<String> titles) {
    List<Widget> widgets = [];
    for (int i = 0; i < titles.length; i++) {
      final hasNewBadge =
          titles[i] == 'Invest' ||
          titles[i] == 'Roqq\'n\'roll' ||
          titles[i] == 'Missions' ||
          titles[i] == 'Copy trading';
      widgets.add(
        _buildMoreForYouListTile(title: titles[i], hasNewBadge: hasNewBadge),
      );
      if (i < titles.length - 1) {
        widgets.add(Container(height: 1, color: AppColors.bgBorder));
      }
    }
    return widgets;
  }

  Widget _buildMoreForYouListTile({
    required String title,
    bool hasNewBadge = false,
  }) {
    return Builder(
      builder: (context) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          dense: true,
          onTap: () {
            if (title == 'Copy trading') {
              onNavigate();
              context.push(AppRoutes.copyTradingIntro);
            }
          },
          leading: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.bgMisc1,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AppAssets.moreForYouLeadingIcon),
          ),
          title: Text(
            title,
            style: AppTypography.headingMobileExtraSmall(
              color: AppColors.textPrimary,
              fontSize: 14,
              lineHeight: 24,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasNewBadge) ...[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  decoration: BoxDecoration(
                    color: Color(0xffDE9B09).withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'New',
                    style: AppTypography.extraSmall(
                      color: AppColors.textWarning,
                    ),
                  ),
                ),
                SizedBox(width: 8),
              ],
              Icon(Icons.chevron_right, color: Colors.white),
            ],
          ),
        );
      },
    );
  }
}
