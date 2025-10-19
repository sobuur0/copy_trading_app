import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';

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
        child: SizedBox(
          height: 106,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    iconPath: 'assets/svgs/home.svg',
                    label: 'Home',
                    index: 0,
                    isEnabled: true,
                  ),
                  _buildNavItem(
                    iconPath: 'assets/svgs/wallet.svg',
                    label: 'Wallet',
                    index: 1,
                    isEnabled: false,
                  ),
                  const SizedBox(width: 80),
                  _buildNavItem(
                    iconPath: 'assets/svgs/transaction.svg',
                    label: 'History',
                    index: 2,
                    isEnabled: false,
                  ),
                  _buildNavItem(
                    iconPath: 'assets/svgs/profile.svg',
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
                  width: 48,
                  height: 48,
                  margin: const EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xff2764FF), Color(0xff1D3573)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
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
