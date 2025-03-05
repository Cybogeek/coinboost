import 'package:flutter/material.dart';

import '../models/reward_level_model.dart';

class RewardLevelProvider with ChangeNotifier {
  final List<RewardLevel> _levels = [
    RewardLevel(level: 'Level 01', minWithdrawal: 50, currentEarnings: 25),
    RewardLevel(level: 'Level 02', minWithdrawal: 100, currentEarnings: 0),
    RewardLevel(level: 'Level 03', minWithdrawal: 150, currentEarnings: 0),
  ];
  RewardLevel _currentLevel = RewardLevel(
    level: 'Leve 01',
    minWithdrawal: 50,
    currentEarnings: 25,
  );
  RewardLevel get currentLevel => _currentLevel;
  List<RewardLevel> get levels => _levels;

  void updateEarnings(String level, double newEarnings) {
    final index = _levels.indexWhere((l) => l.level == level);
    if (index != -1) {
      _levels[index] = RewardLevel(
        level: _levels[index].level,
        minWithdrawal: _levels[index].minWithdrawal,
        currentEarnings: _levels[index].currentEarnings + newEarnings,
      );
      notifyListeners();
    }
  }

  void updateCurrentLevel(index) {
    // final index = _levels.indexWhere((l) => l.currentEarnings == 0);
    if (index != -1) {
      _currentLevel = _levels[index];
      notifyListeners();
    }
  }
}
