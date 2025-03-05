import 'package:flutter/material.dart';

import '../screens/dashboard_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/reward_level_screen.dart';

class BottomNavProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void navigateToScreen(BuildContext context, int index) {
    _selectedIndex = index;
    notifyListeners();

    // Navigate to the corresponding screen
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RewardLevelScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
    }
  }
}
