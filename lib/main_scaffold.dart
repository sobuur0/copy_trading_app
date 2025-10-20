import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_assesement/core/constants/app_assets.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';
import 'package:roqqu_assesement/core/utils/responsive.dart';
import 'package:roqqu_assesement/features/more_for_you/widget/more_for_you_widget.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _showMoreForYou = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    _opacityAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMoreForYou() {
    setState(() {
      _showMoreForYou = !_showMoreForYou;
    });
    if (_showMoreForYou) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final responsive = Responsive(constraints);

        return Scaffold(
          body: Stack(
            children: [
              widget.child,
              if (_showMoreForYou)
                Positioned.fill(
                  bottom: responsive.height(9),
                  child: Container(
                    height: constraints.maxHeight,
                    color: Colors.black.withValues(alpha: .4),
                    child: GestureDetector(
                      // onTap: _toggleMoreForYou,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: FadeTransition(
                            opacity: _opacityAnimation,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: MoreForYouWidget(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: AppColors.bgMisc5),
            child: SizedBox(
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: responsive.height(48),
                        height: responsive.width(48),
                        margin: const EdgeInsets.only(top: 12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.moreForYouButtonGradient,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: _toggleMoreForYou,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            child: Icon(
                              _showMoreForYou
                                  ? Icons.clear
                                  : Icons.grid_view_outlined,
                              key: ValueKey(_showMoreForYou),
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
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
