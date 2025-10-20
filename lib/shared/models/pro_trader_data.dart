class ProTraderData {
  final String name;
  final String initials;
  final int followers;
  final String roi;
  final String totalPnl;
  final String winRate;
  final String aum;
  final bool isVerified;

  ProTraderData({
    required this.name,
    required this.initials,
    required this.followers,
    required this.roi,
    required this.totalPnl,
    required this.winRate,
    required this.aum,
    this.isVerified = false,
  });
}
