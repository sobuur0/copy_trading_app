import 'package:flutter/material.dart';
import 'package:roqqu_assesement/core/constants/app_assets.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';
import 'package:roqqu_assesement/core/utils/responsive.dart';
import 'package:roqqu_assesement/shared/models/intro_page_data.dart';

class CopyTradingIntroScreen extends StatefulWidget {
  const CopyTradingIntroScreen({super.key});

  @override
  State<CopyTradingIntroScreen> createState() => _CopyTradingIntroScreenState();
}

class _CopyTradingIntroScreenState extends State<CopyTradingIntroScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<IntroPageData> _pages = [
    IntroPageData(
      title: 'Copy PRO traders',
      subtitle:
          'Leverage expert strategies from professional traders to boost your trading results.',
      imagePath: AppAssets.copyTradingIntro1,
    ),
    IntroPageData(
      title: 'Do less, Win more',
      subtitle:
          'Streamline your approach to trading and increase your winning potential effortlessly.',
      imagePath: AppAssets.copyTradingIntro2,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final responsive = Responsive(constraints);

        return Scaffold(
          backgroundColor: AppColors.bgPrimary,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.bgPrimary,
            elevation: 0,
            automaticallyImplyLeading: true,
            title: Text(
              'Copy trading',
              style: AppTypography.textMedium(color: Colors.white),
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(responsive.width(16)),
            decoration: BoxDecoration(color: AppColors.bgSecondary),
            child: SafeArea(
              child: Container(
                width: double.infinity,
                height: responsive.height(48),
                decoration: BoxDecoration(
                  gradient: AppColors.getStartedButtonGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    if (_currentPage < _pages.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {}
                  },
                  child: Center(
                    child: Text(
                      'Get started',
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
          ),
          body: Column(
            children: [
              SizedBox(height: responsive.height(16)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(height: 2, color: AppColors.textLink),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 2,
                        color: _currentPage >= 1
                            ? AppColors.textLink
                            : AppColors.bgBorder,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: responsive.height(24)),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return _buildPage(_pages[index], responsive);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPage(IntroPageData pageData, Responsive responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pageData.title,
            style: AppTypography.headingMobileLarge(
              color: AppColors.textPrimary,
              fontSize: 24,
              lineHeight: 32,
            ),
          ),
          SizedBox(height: responsive.height(8)),
          Text(
            pageData.subtitle,
            style: AppTypography.extraSmall(color: AppColors.textSecondary),
          ),

          SizedBox(height: responsive.height(75)),
          Center(child: Image.asset(pageData.imagePath)),
          SizedBox(height: responsive.height(75)),
          Center(
            child: Text(
              'Watch a how to video',
              style: AppTypography.textMedium(color: AppColors.fgLink),
            ),
          ),
        ],
      ),
    );
  }
}
