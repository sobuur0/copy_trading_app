import 'package:flutter/material.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';
import 'package:roqqu_assesement/core/utils/responsive.dart';
import 'package:roqqu_assesement/shared/models/pro_trader_data.dart';
import 'package:roqqu_assesement/shared/widgets/app_bottom_nav_button.dart';
import 'package:roqqu_assesement/features/copy_trading/widgets/risk_confirmation_modal.dart';

class TradingDetailsScreen extends StatefulWidget {
  final ProTraderData trader;

  const TradingDetailsScreen({
    super.key,
    required this.trader,
  });

  @override
  State<TradingDetailsScreen> createState() => _TradingDetailsScreenState();
}

class _TradingDetailsScreenState extends State<TradingDetailsScreen> {
  int _selectedTab = 0;
  final String _selectedPeriod = '7 days';

  final List<String> _tabs = ['Chart', 'Stats', 'All Trades', 'Copiers'];

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
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Trading details',
              style: AppTypography.textMedium(color: Colors.white),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: _buildCopyTradeButton(responsive),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(responsive),
                SizedBox(height: responsive.height(16)),
                _buildStats(responsive),
                SizedBox(height: responsive.height(16)),
                _buildCertifiedBadges(responsive),
                SizedBox(height: responsive.height(24)),
                _buildTabs(responsive),
                SizedBox(height: responsive.height(24)),
                if (_selectedTab == 0) ...[
                  _buildChartSection(responsive),
                  SizedBox(height: responsive.height(24)),
                  _buildSecondChart(responsive),
                  SizedBox(height: responsive.height(24)),
                  _buildAssetsAllocation(responsive),
                  SizedBox(height: responsive.height(24)),
                  _buildHoldingPeriod(responsive),
                  SizedBox(height: responsive.height(24)),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: responsive.width(48),
                height: responsive.width(48),
                decoration: BoxDecoration(
                  color: AppColors.bgBorder,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    widget.trader.initials,
                    style: AppTypography.textMedium(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              if (widget.trader.isVerified)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: responsive.width(16),
                    height: responsive.width(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.bgPrimary,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: responsive.width(10),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: responsive.width(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.trader.name,
                  style: AppTypography.headingMobileExtraSmall(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    lineHeight: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                      color: AppColors.textSecondary,
                      size: responsive.width(14),
                    ),
                    SizedBox(width: responsive.width(4)),
                    Text(
                      '${widget.trader.followers} Copiers',
                      style: AppTypography.extraSmall(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
      child: Row(
        children: [
          _buildStatItem('43 trading days', responsive),
          SizedBox(width: responsive.width(12)),
          _buildStatItem('15% profit-share', responsive),
          SizedBox(width: responsive.width(12)),
          _buildStatItem('56 total orders', responsive),
        ],
      ),
    );
  }

  Widget _buildStatItem(String text, Responsive responsive) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.width(12),
          vertical: responsive.height(8),
        ),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTypography.extraSmall(
            color: AppColors.textSecondary,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildCertifiedBadges(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
      child: Container(
        padding: EdgeInsets.all(responsive.width(16)),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Certified PROtrader',
              style: AppTypography.headingMobileExtraSmall(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: responsive.height(12)),
            Row(
              children: [
                Icon(
                  Icons.verified,
                  color: Color(0xff4CAF50),
                  size: responsive.width(16),
                ),
                SizedBox(width: responsive.width(8)),
                Text(
                  'High win rate',
                  style: AppTypography.extraSmall(
                    color: Color(0xff4CAF50),
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: responsive.width(24)),
                Icon(
                  Icons.trending_up,
                  color: Color(0xffFF9800),
                  size: responsive.width(16),
                ),
                SizedBox(width: responsive.width(8)),
                Text(
                  'Great risk control',
                  style: AppTypography.extraSmall(
                    color: Color(0xffFF9800),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
      child: Row(
        children: List.generate(
          _tabs.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: responsive.height(12)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedTab == index
                          ? AppColors.fgLink
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  _tabs[index],
                  textAlign: TextAlign.center,
                  style: AppTypography.extraSmall(
                    color: _selectedTab == index
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                    fontSize: 14,
                    fontWeight: _selectedTab == index
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChartSection(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
      child: Container(
        padding: EdgeInsets.all(responsive.width(16)),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ROI',
                  style: AppTypography.headingMobileExtraSmall(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _buildPeriodSelector(responsive),
              ],
            ),
            SizedBox(height: responsive.height(16)),
            SizedBox(
              height: responsive.height(200),
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodSelector(Responsive responsive) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.width(8),
        vertical: responsive.height(4),
      ),
      decoration: BoxDecoration(
        color: AppColors.bgPrimary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Text(
            _selectedPeriod,
            style: AppTypography.extraSmall(
              color: AppColors.textPrimary,
              fontSize: 12,
            ),
          ),
          SizedBox(width: responsive.width(4)),
          Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textPrimary,
            size: responsive.width(16),
          ),
        ],
      ),
    );
  }

  Widget _buildCopyTradeButton(Responsive responsive) {
    return AppBottomNavButton(
      text: 'Copy trade',
      responsive: responsive,
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.black.withOpacity(0.5),
          isScrollControlled: true,
          builder: (context) => const RiskConfirmationModal(),
        );
      },
    );
  }

  Widget _buildSecondChart(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
      child: Container(
        padding: EdgeInsets.all(responsive.width(16)),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(
              height: responsive.height(200),
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetsAllocation(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
      child: Container(
        padding: EdgeInsets.all(responsive.width(16)),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Assets allocation',
                  style: AppTypography.headingMobileExtraSmall(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _buildPeriodSelector(responsive),
              ],
            ),
            SizedBox(height: responsive.height(24)),
            Center(
              child: SizedBox(
                width: responsive.width(200),
                height: responsive.width(200),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Placeholder(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BTCUSDT',
                          style: AppTypography.extraSmall(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '100.00%',
                          style: AppTypography.headingMobileExtraSmall(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoldingPeriod(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
      child: Container(
        padding: EdgeInsets.all(responsive.width(16)),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Holding period',
                  style: AppTypography.headingMobileExtraSmall(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _buildPeriodSelector(responsive),
              ],
            ),
            SizedBox(height: responsive.height(16)),
            SizedBox(
              height: responsive.height(150),
              child: Placeholder(),
            ),
            SizedBox(height: responsive.height(12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem('Profit', Color(0xff4CAF50), responsive),
                SizedBox(width: responsive.width(16)),
                _buildLegendItem('Loss', Color(0xffF44336), responsive),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color, Responsive responsive) {
    return Row(
      children: [
        Container(
          width: responsive.width(8),
          height: responsive.width(8),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: responsive.width(8)),
        Text(
          label,
          style: AppTypography.extraSmall(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
