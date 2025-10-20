import 'package:flutter/material.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';
import 'package:roqqu_assesement/core/utils/responsive.dart';
import 'package:roqqu_assesement/shared/widgets/app_bottom_nav_button.dart';

class ConversationalEngagementScreen extends StatefulWidget {
  const ConversationalEngagementScreen({super.key});

  @override
  State<ConversationalEngagementScreen> createState() =>
      _ConversationalEngagementScreenState();
}

class _ConversationalEngagementScreenState
    extends State<ConversationalEngagementScreen> {
  int _selectedProfile = 0;

  final List<RiskProfile> _profiles = [
    RiskProfile(
      title: 'Conservative profile',
      description:
          'Conservative profile involves stable returns from proven strategies with minimal volatility.',
    ),
    RiskProfile(
      title: 'Steady growth profile',
      description:
          'Steady growth involves balanced gains with moderate fluctuations in strategy performance.',
    ),
    RiskProfile(
      title: 'Exponential growth profile',
      description:
          'It has potentials for significant gains or losses due to aggressive trading and market exposure.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final responsive = Responsive(constraints);

        return Scaffold(
          backgroundColor: AppColors.bgPrimary,
          appBar: AppBar(
            backgroundColor: AppColors.bgPrimary,
            elevation: 0,
            automaticallyImplyLeading: true,
            title: Text(
              'Copy trading',
              style: AppTypography.textMedium(color: Colors.white),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: AppBottomNavButton(
            text: 'Proceed',
            responsive: responsive,
            onTap: () {},
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: responsive.height(24)),
                Text(
                  'What risk level are you comfortable exploring?',
                  style: AppTypography.headingMobileLarge(
                    color: AppColors.textPrimary,
                    fontSize: 24,
                    lineHeight: 32,
                  ),
                ),
                SizedBox(height: responsive.height(8)),
                Text(
                  'Choose a level',
                  style: AppTypography.extraSmall(
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: responsive.height(24)),
                ...List.generate(
                  _profiles.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: responsive.height(16)),
                    child: _buildProfileCard(
                      profile: _profiles[index],
                      isSelected: _selectedProfile == index,
                      onTap: () {
                        setState(() {
                          _selectedProfile = index;
                        });
                      },
                      responsive: responsive,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileCard({
    required RiskProfile profile,
    required bool isSelected,
    required VoidCallback onTap,
    required Responsive responsive,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.all(responsive.width(16)),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.fgLink : AppColors.bgBorder,
            width: 1,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: responsive.width(27),
                  height: responsive.width(17),
                  decoration: BoxDecoration(
                    color: AppColors.fgLink,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
            Padding(
              padding: EdgeInsets.all(responsive.width(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.title,
                    style: AppTypography.headingMobileExtraSmall(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      lineHeight: 24,
                    ),
                  ),
                  SizedBox(height: responsive.height(8)),
                  Text(
                    profile.description,
                    style: AppTypography.extraSmall(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RiskProfile {
  final String title;
  final String description;

  RiskProfile({required this.title, required this.description});
}
