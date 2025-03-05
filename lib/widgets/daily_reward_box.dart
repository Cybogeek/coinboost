import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../provider/reward_level_provider.dart';
import '../utils/ads_helper.dart';

class DailyRewardBox extends StatefulWidget {
  const DailyRewardBox({super.key, required this.index, required this.size});
  final int index;
  final double size;

  @override
  State<DailyRewardBox> createState() => _DailyRewardBoxState();
}

class _DailyRewardBoxState extends State<DailyRewardBox> {
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;
  bool _isAdUsedToday = false;

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _interstitialAd = ad;
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (error) {
          print('Failed to load interstitial ad: $error');
        },
      ),
    );
  }

  @override
  dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null && _isAdLoaded && !_isAdUsedToday) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          // Award 2 points to the user
          final rewardProvider = Provider.of<RewardLevelProvider>(
            context,
            listen: false,
          );
          rewardProvider.updateEarnings('Level 01', 2);

          // Mark the ad as used for the day
          setState(() {
            _isAdUsedToday = true;
          });

          // Dispose the ad
          ad.dispose();
          _loadInterstitialAd(); // Load a new ad
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          print('Failed to show interstitial ad: $error');
          ad.dispose();
          _loadInterstitialAd(); // Load a new ad
        },
      );
      _interstitialAd!.show();
    } else {
      // print('Ad not loaded or already used today');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ad not loaded or already used today')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isCenter = widget.index == 3;
    return Flexible(
      flex: isCenter ? 2 : 1,
      child: Padding(
        padding:
            !isCenter
                ? const EdgeInsets.only(top: 8.0)
                : const EdgeInsets.all(0),
        child: InkWell(
          onTap:
              isCenter
                  ? () {
                    _isAdUsedToday ? null : _showInterstitialAd();
                  }
                  : null, // Center box is clickable
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: isCenter ? Colors.white : null,
              gradient:
                  isCenter
                      ? null
                      : LinearGradient(
                        colors: [Color(0xFFF7931A), Color(0xFFFFAB45)],
                      ),
              border: Border.all(color: Color(0xFFF7931A), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '\$2\nAD',
                  style: GoogleFonts.robotoMono(
                    fontSize:
                        isCenter ? 16 : 14, // Adjust font size for center box
                    fontWeight: FontWeight.bold,
                    color: isCenter ? Color(0xFFF7931A) : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
