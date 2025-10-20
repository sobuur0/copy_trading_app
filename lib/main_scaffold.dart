import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assesement/core/constants/app_assets.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';
import 'package:roqqu_assesement/core/utils/responsive.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppColors.bgMisc5),
        child: LayoutBuilder(
          builder: (context, constraint) {
            final responsive = Responsive(constraint);

            return SizedBox(
              height: responsive.height(106),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(
                        iconPath: AppAssets.home,
                        label: 'Home',
                        index: 0,
                        isEnabled: true,
                      ),
                      _buildNavItem(
                        iconPath: AppAssets.wallet,
                        label: 'Wallet',
                        index: 1,
                        isEnabled: false,
                      ),
                      SizedBox(width: responsive.width(80)),
                      _buildNavItem(
                        iconPath: AppAssets.transaction,
                        label: 'History',
                        index: 2,
                        isEnabled: false,
                      ),
                      _buildNavItem(
                        iconPath: AppAssets.profile,
                        label: 'Profile',
                        index: 3,
                        isEnabled: false,
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      width: responsive.height(48),
                      height: responsive.width(48),
                      margin: const EdgeInsets.only(top: 12),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.moreForYouButtonGradient,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {},
                        child: const Icon(
                          Icons.grid_view_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
    required bool isEnabled,
  }) {
    final bool isSelected = _selectedIndex == index;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEnabled ? () => _onItemTapped(index) : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isEnabled
                      ? (isSelected
                            ? AppColors.textPrimary
                            : AppColors.textSecondary)
                      : AppColors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTypography.extraSmall(
                  color: isEnabled
                      ? (isSelected
                            ? AppColors.textPrimary
                            : AppColors.textSecondary)
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
