import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'daily_reward_box.dart';

class DashDailyReward extends StatelessWidget {
  const DashDailyReward({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Claim your Daily Reward',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 150, 82, 0),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 5),
            // First Box (Smallest)
            DailyRewardBox(index: 0, size: 40),
            SizedBox(width: 5),
            // Second Box (Slightly Larger)
            DailyRewardBox(index: 1, size: 50),
            SizedBox(width: 5),
            // Third Box (Larger)
            DailyRewardBox(index: 2, size: 60),
            SizedBox(width: 5),
            // Center Box (Largest)
            DailyRewardBox(index: 3, size: 80),
            SizedBox(width: 5),
            // Third Last Box (Larger)
            DailyRewardBox(index: 4, size: 60),
            SizedBox(width: 5),
            // Second Last Box (Slightly Larger)
            DailyRewardBox(index: 5, size: 50),
            SizedBox(width: 5),
            // Last Box (Smallest)
            DailyRewardBox(index: 6, size: 40),
            SizedBox(width: 5),
          ],
        ),
      ],
    );
  }
}
