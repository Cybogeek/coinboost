class RewardLevel {
  final String level;
  final double minWithdrawal;
  final double currentEarnings;

  RewardLevel({
    required this.level,
    required this.minWithdrawal,
    required this.currentEarnings,
  });

  double get progress => currentEarnings / minWithdrawal;
}
