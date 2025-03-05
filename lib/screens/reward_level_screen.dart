import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/reward_level_provider.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/reward_level.dart';

class RewardLevelScreen extends StatelessWidget {
  const RewardLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rewardLevelProvider = Provider.of<RewardLevelProvider>(context);
    final levels = rewardLevelProvider.levels;

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Rewarding Levels',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView(
                    children:
                        levels
                            .map((level) => RewardLevelWidget(level: level))
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigation(identifier: 1),
        ),
      ),
    );
  }
}
