import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bottomnav_provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.identifier});
  final int identifier;
  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomNavProvider>(context);
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Levels'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: bottomProvider.selectedIndex, // Default selected index
      selectedItemColor: Colors.white, // Primary color
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.white.withAlpha(200),
      backgroundColor: Theme.of(context).primaryColor,
      onTap: (value) {
        bottomProvider.navigateToScreen(context, value);
      },
    );
  }
}
