import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roqqu_assesement/core/constants/app_assets.dart';
import 'package:roqqu_assesement/core/theme/app_colors.dart';
import 'package:roqqu_assesement/core/theme/app_typography.dart';
import 'package:roqqu_assesement/core/utils/responsive.dart';
import 'package:roqqu_assesement/shared/models/coin_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentUpdateIndex = 0;
  final ScrollController _scrollController = ScrollController();

  static final List<CoinData> _coins = [
    CoinData(
      iconPath: AppAssets.bitcoinIcon,
      name: 'Bitcoin',
      symbol: 'BTC',
      price: '\$22,840',
      changePercent: '-0.61%',
      isPositive: false,
    ),
    CoinData(
      iconPath: AppAssets.ethereumIcon,
      name: 'Ethereum',
      symbol: 'ETH',
      price: '\$0.36',
      changePercent: '-0.61%',
      isPositive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final responsive = Responsive(constraint);

        return Stack(
          children: [
            Container(
              height: constraint.maxHeight * 0.21,
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              decoration: BoxDecoration(gradient: AppColors.homeHeaderGradient),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColors.grayishBlue.withValues(alpha: .12),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .04),
                            blurRadius: 1,
                            offset: Offset(0, 3),
                          ),
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .12),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Crypto',
                            style: AppTypography.small(
                              color: AppColors.baseBlack,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.baseBlack,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(CupertinoIcons.search, color: AppColors.bgPrimary),
                  SizedBox(width: 16),
                  SvgPicture.asset(AppAssets.headphones),
                  SizedBox(width: 16),
                  SvgPicture.asset(AppAssets.notificationIcon),
                  SizedBox(width: 16),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.grayishBlue.withValues(alpha: .12),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.flagIcon),
                        SizedBox(width: 8),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.baseBlack,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: constraint.maxHeight * 0.17,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.bgPrimary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: responsive.height(24)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your GBP Balance',
                            style: AppTypography.extraSmall(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.visibility_outlined,
                            size: 14,
                            color: AppColors.textSecondary,
                          ),
                        ],
                      ),
                      SizedBox(height: responsive.height(8)),
                      Text.rich(
                        TextSpan(
                          text: '£0.',
                          style: AppTypography.headingMobileLarge(
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: '00',
                              style: AppTypography.headingMobileExtraSmall(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: responsive.height(24)),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.bgSecondary,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.bgBorder),
                        ),
                        child: Row(
                          children: [
                            _homeIconWIdget(
                              iconPath: AppAssets.depositIcon,
                              title: 'Deposit',
                            ),
                            _homeIconWIdget(
                              iconPath: AppAssets.buyIcon,
                              title: 'Buy',
                            ),
                            _homeIconWIdget(
                              iconPath: AppAssets.withdrawIcon,
                              title: 'Withdraw',
                            ),
                            _homeIconWIdget(
                              iconPath: AppAssets.sellIcon,
                              title: 'Sell',
                            ),
                          ],
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 11,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.bgSecondary,
                            border: Border.all(
                              color: AppColors.bgBorder,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff323247).withValues(alpha: .05),
                                blurRadius: 8,
                                spreadRadius: -1,
                                offset: Offset(0, 3),
                              ),
                              BoxShadow(
                                color: Color(0xff0C1A4B).withValues(alpha: .25),
                                blurRadius: 1,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Text(
                            'See more',
                            style: AppTypography.extraSmall(
                              fontWeight: FontWeight.w500,
                              color: AppColors.textLink,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: responsive.height(32)),

                      Container(
                        height: constraint.maxWidth * 0.28,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border(),
                          gradient: AppColors.copyTradingCardGradient,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: SvgPicture.asset(AppAssets.roqqNdRollIcon),
                            ),

                            Positioned(
                              top: 16,
                              left: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Copy Trading',
                                    style: AppTypography.headingMobileSmall(
                                      color: AppColors.baseBlack,
                                    ),
                                  ),
                                  Text(
                                    'Discover our latest feature. Follow and watch\nthe PRO traders closely and win like a PRO!\nWe are rooting for you!',
                                    style: AppTypography.extraSmall(
                                      color: AppColors.baseBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: responsive.height(32)),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Stay Updated',
                          style: AppTypography.headingMobileExtraSmall(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                            lineHeight: 24,
                          ),
                        ),
                      ),

                      SizedBox(height: responsive.height(15)),

                      SizedBox(
                        height: constraint.maxWidth * 0.22,
                        child: ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                right: index < 2 ? 12 : 0,
                              ),
                              child: _buildUpdateCard(
                                constraint: constraint,
                                index: index,
                                iconPath: index == 0
                                    ? Icons.notifications_outlined
                                    : null,
                                svgPath: index != 0 ? AppAssets.coinSwap : null,
                                title: index == 0
                                    ? 'Delisting coins'
                                    : index == 1
                                    ? 'Exchange Rates'
                                    : 'Roqqu Expands to Europe',
                                subtitle: index == 0
                                    ? 'View the list of coins we are delisting'
                                    : index == 1
                                    ? 'View all currencies rate at a glance'
                                    : 'We are now on the shores of europe',
                                hasUrgentNotice: index == 0,
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: responsive.height(8)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentUpdateIndex == index
                                  ? AppColors.bgMisc4
                                  : AppColors.bgMisc1,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: responsive.height(19)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Listed Coins',
                              style: AppTypography.headingMobileExtraSmall(
                                color: AppColors.textSecondary,
                                fontSize: 14,
                                lineHeight: 24,
                              ),
                            ),
                            Text(
                              'See all',
                              style: AppTypography.xBold(
                                color: AppColors.textLink,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: responsive.height(12)),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.bgSecondary,
                          border: Border.all(
                            color: AppColors.bgBorder,
                            width: 1,
                          ),
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
                        child: SizedBox(
                          height: constraint.maxWidth * 0.7,
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: _coins.length,
                            separatorBuilder: (context, index) =>
                                Container(height: 1, color: AppColors.bgBorder),
                            itemBuilder: (context, index) {
                              final coin = _coins[index];
                              return _buildCoinListTile(
                                iconPath: coin.iconPath,
                                name: coin.name,
                                symbol: coin.symbol,
                                price: coin.price,
                                changePercent: coin.changePercent,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _homeIconWIdget({required String iconPath, required String title}) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.bgPrimary,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(iconPath),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: AppTypography.extraSmall(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildCoinListTile({
    required String iconPath,
    required String name,
    required String symbol,
    required String price,
    required String changePercent,
  }) {
    final isPositive = !changePercent.startsWith('-');

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      leading: SvgPicture.asset(iconPath),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTypography.headingMobileExtraSmall(
              color: AppColors.textPrimary,
              fontSize: 14,
              lineHeight: 24,
            ),
          ),
          SizedBox(height: 4),
          Text(
            symbol,
            style: AppTypography.extraSmall(color: AppColors.textSecondary),
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            price,
            style: AppTypography.headingMobileExtraSmall(
              color: AppColors.textPrimary,
              fontSize: 14,
              lineHeight: 24,
            ),
          ),
          SizedBox(height: 4),
          Text(
            changePercent,
            style: AppTypography.extraSmall(
              color: isPositive ? AppColors.textSuccess : AppColors.textError,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateCard({
    required BoxConstraints constraint,
    required int index,
    IconData? iconPath,
    String? svgPath,
    required String title,
    required String subtitle,
    required bool hasUrgentNotice,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentUpdateIndex = index;
        });
        final cardWidth = constraint.maxWidth * 0.85;
        final spacing = 12.0;
        final targetOffset = (cardWidth + spacing) * index;
        _scrollController.animateTo(
          targetOffset,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        width: constraint.maxWidth * 0.85,
        padding: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.bgSecondary,
        ),
        child: Stack(
          children: [
            if (hasUrgentNotice)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.redPrimary.withValues(alpha: .08),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Urgent Notice',
                    style: AppTypography.extraSmall(color: AppColors.textError),
                  ),
                ),
              ),
            Positioned(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: AppColors.bgPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: iconPath != null
                        ? Icon(iconPath, color: Colors.white)
                        : SvgPicture.asset(svgPath!),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: AppTypography.headingMobileExtraSmall(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            lineHeight: 24,
                          ),
                        ),
                        Text(
                          subtitle,
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
          ],
        ),
      ),
    );
  }
}
