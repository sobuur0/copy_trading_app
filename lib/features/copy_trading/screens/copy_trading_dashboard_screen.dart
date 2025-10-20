import 'package:flutter/material.dart';
import 'package:roqqu_assesement/core/constants/app_assets.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';
import 'package:roqqu_assesement/core/utils/responsive.dart';
import 'package:roqqu_assesement/shared/models/dashboard_card_data.dart';
import 'package:roqqu_assesement/shared/models/pro_trader_data.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CopyTradingDashboardScreen extends StatelessWidget {
  const CopyTradingDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DashboardCardData> dashboardCards = [
      DashboardCardData(
        title: 'My dashboard',
        subtitle: 'View trades',
        iconPath: AppAssets.copyTradeDashboardIcon,
        gradientColors: [Color(0xffB3E5FC), Color(0xffE1F5FE)],
      ),
      DashboardCardData(
        title: 'Become a PRO trader',
        subtitle: 'Apply Now',
        iconPath: AppAssets.copyTradeDashboardIcon,
        gradientColors: [Color(0xffE1BEE7), Color(0xffF3E5F5)],
      ),
    ];

    final List<ProTraderData> traders = [
      ProTraderData(
        name: 'Jay isisou',
        initials: 'JI',
        followers: 500,
        roi: '+120.62%',
        totalPnl: '\$38,667.29',
        winRate: '100%',
        aum: '38,667.29',
        isVerified: true,
      ),
      ProTraderData(
        name: 'Laura okobi',
        initials: 'LO',
        followers: 500,
        roi: '+120.62%',
        totalPnl: '\$38,667.29',
        winRate: '100%',
        aum: '38,667.29',
        isVerified: true,
      ),
      ProTraderData(
        name: 'BTC master',
        initials: 'BM',
        followers: 500,
        roi: '+120.62%',
        totalPnl: '\$38,667.29',
        winRate: '100%',
        aum: '38,667.29',
        isVerified: true,
      ),
    ];

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
              'Copy trading',
              style: AppTypography.textMedium(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: responsive.width(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: responsive.height(24)),
                Row(
                  children: [
                    Expanded(
                      child: _buildDashboardCard(dashboardCards[0], responsive),
                    ),
                    SizedBox(width: responsive.width(16)),
                    Expanded(
                      child: _buildDashboardCard(dashboardCards[1], responsive),
                    ),
                  ],
                ),
                SizedBox(height: responsive.height(24)),
                Text(
                  'PRO Traders',
                  style: AppTypography.headingMobileExtraSmall(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    lineHeight: 24,
                  ),
                ),
                SizedBox(height: responsive.height(16)),
                ...traders.map(
                  (trader) => Padding(
                    padding: EdgeInsets.only(bottom: responsive.height(16)),
                    child: _buildTraderCard(trader, responsive),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDashboardCard(DashboardCardData card, Responsive responsive) {
    return Container(
      padding: EdgeInsets.all(responsive.width(16)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: card.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: responsive.width(32),
            height: responsive.width(32),
            decoration: BoxDecoration(
              color: Color(0xff263238),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SvgPicture.asset(
                card.iconPath,
                width: responsive.width(20),
                height: responsive.width(20),
              ),
            ),
          ),
          SizedBox(height: responsive.height(32)),
          Text(
            card.title,
            style: AppTypography.extraSmall(
              color: Color(0xff263238),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: responsive.height(4)),
          Row(
            children: [
              Text(
                card.subtitle,
                style: AppTypography.extraSmall(
                  color: Color(0xff263238),
                  fontSize: 10,
                ),
              ),
              SizedBox(width: responsive.width(4)),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff263238),
                size: responsive.width(10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTraderCard(ProTraderData trader, Responsive responsive) {
    return Container(
      padding: EdgeInsets.all(responsive.width(16)),
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: responsive.width(40),
                    height: responsive.width(40),
                    decoration: BoxDecoration(
                      color: AppColors.bgBorder,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        trader.initials,
                        style: AppTypography.extraSmall(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  if (trader.isVerified)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: responsive.width(14),
                        height: responsive.width(14),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.bgSecondary,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: responsive.width(8),
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
                      trader.name,
                      style: AppTypography.extraSmall(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.people,
                          color: AppColors.textSecondary,
                          size: responsive.width(12),
                        ),
                        SizedBox(width: responsive.width(4)),
                        Text(
                          '${trader.followers}',
                          style: AppTypography.extraSmall(
                            color: AppColors.textSecondary,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.width(12),
                  vertical: responsive.height(6),
                ),
                decoration: BoxDecoration(
                  color: AppColors.bgPrimary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Copy',
                  style: AppTypography.extraSmall(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: responsive.height(16)),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ROI',
                      style: AppTypography.extraSmall(
                        color: AppColors.textSecondary,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      trader.roi,
                      style: AppTypography.extraSmall(
                        color: Color(0xff4CAF50),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: responsive.height(4)),
                    Text(
                      'Total PNL: ${trader.totalPnl}',
                      style: AppTypography.extraSmall(
                        color: AppColors.textSecondary,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: responsive.width(100),
                height: responsive.height(60),
                child: Placeholder(),
              ),
            ],
          ),
          SizedBox(height: responsive.height(16)),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'Win rate: ',
                      style: AppTypography.extraSmall(
                        color: AppColors.textSecondary,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      trader.winRate,
                      style: AppTypography.extraSmall(
                        color: AppColors.textPrimary,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: AppColors.textSecondary,
                    size: responsive.width(12),
                  ),
                  SizedBox(width: responsive.width(4)),
                  Text(
                    'AUM: ',
                    style: AppTypography.extraSmall(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    trader.aum,
                    style: AppTypography.extraSmall(
                      color: AppColors.textPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
