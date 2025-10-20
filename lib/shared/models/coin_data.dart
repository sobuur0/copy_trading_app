class CoinData {
  final String iconPath;
  final String name;
  final String symbol;
  final String price;
  final String changePercent;
  final bool isPositive;

  CoinData({
    required this.iconPath,
    required this.name,
    required this.symbol,
    required this.price,
    required this.changePercent,
    required this.isPositive,
  });
}
