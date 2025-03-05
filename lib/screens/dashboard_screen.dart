import 'package:coinboost/widgets/dash_task_section.dart';
import 'package:coinboost/widgets/dash_topbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bottomnav_provider.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/dash_daily_reward.dart';
import 'profile_screen.dart';
import 'reward_level_screen.dart'; // For custom fonts

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    // Define the content for each bottom nav item
    // final List<Widget> widgetOptions = [
    //   HomeContent(), // Replace with your Home Screen content
    //   RewardLevelScreen(), // Reward Level Screen
    //   ProfileScreen(), // Replace with your Profile Screen content
    // ];
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              // Top Bar
              DashTopbar(),
              SizedBox(height: 20),

              // Daily Reward Section
              DashDailyReward(),
              SizedBox(height: 20),

              // Task Section
              DashTaskSection(),
            ],
          ),
          bottomNavigationBar: BottomNavigation(identifier: 1),
        ),
      ),
    );
  }

  // Widget HomeContent() {
  //   return Column(
  //     children: [
  //       // Top Bar
  //       DashTopbar(),
  //       SizedBox(height: 20),

  //       // Daily Reward Section
  //       DashDailyReward(),
  //       SizedBox(height: 20),

  //       // Task Section
  //       DashTaskSection(),
  //     ],
  //   );
  // }
}
