# CoinBoost - Earning App
CoinBoost Logo <!-- Replace with your app logo -->

CoinBoost is a mobile earning app built with Flutter and Dart,. It isdesigned to help users earn rewards by completing tasks such as reading news, playing games, and watching ads. The app integrates Google Ads to provide additional rewards through rewarded ads. It is a scalable and user-friendly platform for earning rewards while engaging with content.

Features
Task Completion:

Users can complete tasks like reading news or playing games.

Rules are enforced to ensure active participation (e.g., scrolling for 10 minutes, interacting every 30 seconds).

Reward System:

Users earn points or rupees for completing tasks.

Rewards are tracked using a RewardLevelProvider.

Google Ads Integration:

Rewarded ads are shown to users, allowing them to earn additional points.

Ads are integrated using the google_mobile_ads library.

Daily Rewards:

Users can claim daily rewards by watching ads.

A collapsible floating container allows users to claim 10 points once per session.

State Management:

The app uses Provider for state management to handle task progress, rewards, and ad interactions.

Screenshots
Home Screen	Daily Rewards	Task Show Page
Home Screen	Daily Rewards	Task Show Page
Libraries Used
Flutter: UI framework for building the app.

Provider: State management library.

google_mobile_ads: Library for integrating Google Ads.

google_fonts: Library for custom fonts.

Timer: For tracking user activity and task progress.

Getting Started
Prerequisites
Flutter SDK (version 3.0 or higher)

Dart SDK (version 2.18 or higher)

Android Studio or VS Code (with Flutter and Dart plugins)

Google AdMob account (for ad integration)

Installation
Clone the repository:

bash
Copy
git clone https://github.com/your-username/coinboost.git
Navigate to the project directory:

bash
Copy
cd coinboost
Install dependencies:

bash
Copy
flutter pub get
Run the app:

bash
Copy
flutter run
Configuration
Google Ads Integration
Create an AdMob account and register your app.

Add your App ID and Ad Unit IDs to the AndroidManifest.xml and Info.plist files.

Replace the test ad IDs in the ad_helper.dart file with your actual AdMob ad unit IDs.

Scope of Correction and Advancement
Fixes Applied
Resolved overflow issues in the Daily Reward Section.

Fixed state update errors during the build process using WidgetsBinding.instance.addPostFrameCallback.

Ensured the bottom navigation bar works consistently across all screens.

Advancements
Added a collapsible floating container for claiming 10 points.

Integrated Google Ads for rewarded ads.

Improved user feedback with SnackBar messages.

Future Improvements
User Authentication:

Add login/signup functionality to track user progress across devices.

Leaderboard:

Introduce a leaderboard to encourage competition among users.

More Tasks:

Add additional tasks like watching videos, taking surveys, or referring friends.

In-App Purchases:

Allow users to purchase premium features or remove ads.

Enhanced Ad Integration:

Add interstitial ads and banner ads for additional monetization.

Localization:

Support multiple languages to reach a global audience.

Analytics:

Integrate Firebase Analytics to track user behavior and app performance.

Gamification:

Add badges, levels, and achievements to make the app more engaging.

Contributing
Contributions are welcome! If you'd like to contribute to CoinBoost, please follow these steps:

Fork the repository.

Create a new branch for your feature or bugfix.

Commit your changes.

Push your branch and submit a pull request.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Thank you for checking out CoinBoost! 🚀

