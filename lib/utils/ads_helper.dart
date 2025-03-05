import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static InterstitialAd? _interstitialAd;
  // Banner Ad Unit ID (replace with your own ad unit ID)
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111'; // Test ID for Android
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // Test ID for iOS
    }
    throw UnsupportedError('Unsupported platform');
  }

  // Interstitial Ad Unit ID (replace with your own ad unit ID)
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712'; // Test ID for Android
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910'; // Test ID for iOS
    }
    throw UnsupportedError('Unsupported platform');
  }

  static String get rewardedAdUnitId {
    return 'ca-app-pub-3940256099942544/5224354917'; // Test rewarded ad ID
  }
}
