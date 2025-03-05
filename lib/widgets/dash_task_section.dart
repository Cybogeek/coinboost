import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'task_card.dart';

class DashTaskSection extends StatelessWidget {
  const DashTaskSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Do Task, Earn Reward',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF965200),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'You can do these tasks as many times as you want to',
            style: GoogleFonts.robotoMono(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0D0D0D),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          // Task Cards
          TaskCard(
            title: 'PlayGame',
            reward: '\$10',
            imagePath: 'assets/images/game.png',
          ),
          SizedBox(height: 32),
          TaskCard(
            title: 'Read News',
            reward: '\$5',
            imagePath: 'assets/images/news.png',
          ),
        ],
      ),
    );
  }
}
