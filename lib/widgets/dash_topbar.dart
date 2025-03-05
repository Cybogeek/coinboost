import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashTopbar extends StatelessWidget {
  const DashTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Row(
        children: [
          // Circular Avatar
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(
              'assets/images/profile.png',
            ), // Replace with user avatar
          ),
          SizedBox(width: 10),
          Text(
            'User Name',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),

          // Reward Image
          Row(
            children: [
              Image.asset(
                'assets/images/star-medal.png', // Replace with reward image
                width: 30,
                height: 30,
              ),
              Text(
                'Level 01',
                style: GoogleFonts.robotoMono(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(width: 20),

          // Wallet Image
          Row(
            children: [
              Image.asset(
                'assets/images/wallet.png', // Replace with wallet image
                width: 30,
                height: 30,
              ),
              Text(
                '\$25.00',
                style: GoogleFonts.robotoMono(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
