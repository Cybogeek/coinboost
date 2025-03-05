# CoinBoost - Earning App
<img width="219" alt="LOGO" src="https://github.com/user-attachments/assets/c598c15c-5376-4a2a-baa3-f7cffca0241a" />


**CoinBoost** is a mobile earning app built with **Flutter** and **Dart**, designed to help users earn rewards by completing tasks such as reading news, playing games, and watching ads. The app integrates **Google Ads** to provide additional rewards through **rewarded ads**. It is a scalable and user-friendly platform for earning rewards while engaging with content.

---

## Features

- **Task Completion**:
  - Users can complete tasks like reading news or playing games.
  - Rules are enforced to ensure active participation (e.g., scrolling for 10 minutes, interacting every 30 seconds).

- **Reward System**:
  - Users earn points or rupees for completing tasks.
  - Rewards are tracked using a **RewardLevelProvider**.

- **Google Ads Integration**:
  - Rewarded ads are shown to users, allowing them to earn additional points.
  - Ads are integrated using the **google_mobile_ads** library.

- **Daily Rewards**:
  - Users can claim daily rewards by watching ads.
  - A collapsible floating container allows users to claim 10 points once per session.

- **State Management**:
  - The app uses **Provider** for state management to handle task progress, rewards, and ad interactions.

---

## Screenshots

| Home Screen | Daily Rewards | Task Show Page |
|-------------|---------------|----------------|
| ![Screenshot_1741184927](https://github.com/user-attachments/assets/e435f2bc-7be4-4461-8e63-a2adc3b6e187) | ![Screenshot_1741184722](https://github.com/user-attachments/assets/34aa584a-f655-4e8f-8884-5651fb02154f)| ![Screenshot_1741184751](https://github.com/user-attachments/assets/df806124-72c0-4192-89b0-7d0a13b96070) |


![Screenshot_1741184729](https://github.com/user-attachments/assets/7e86a056-ea0d-48a9-9ac7-6b7f9ae606b9)



---

## Libraries Used

- **Flutter**: UI framework for building the app.
- **Provider**: State management library.
- **google_mobile_ads**: Library for integrating Google Ads.
- **google_fonts**: Library for custom fonts.
- **Timer**: For tracking user activity and task progress.

---

## Getting Started

### Prerequisites

- Flutter SDK (version 3.0 or higher)
- Dart SDK (version 2.18 or higher)
- Android Studio or VS Code (with Flutter and Dart plugins)
- Google AdMob account (for ad integration)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Cybogeek/coinboost.git

2. Navigate to the project directory:

  ```bash
  cd coinboost

3. Install dependencies:

 ```bash
  flutter pub get

4. Run the app:

  ```bash
  flutter run

##Configuration
###Google Ads Integration
Create an AdMob account and register your app.

Add your App ID and Ad Unit IDs to the AndroidManifest.xml and Info.plist files.

Replace the test ad IDs in the ad_helper.dart file with your actual AdMob ad unit IDs.

##Scope of Correction and Advancement
###Fixes Applied
Resolved overflow issues in the Daily Reward Section.

Fixed state update errors during the build process using WidgetsBinding.instance.addPostFrameCallback.

Ensured the bottom navigation bar works consistently across all screens.

###Advancements
Added a collapsible floating container for claiming 10 points.

Integrated Google Ads for rewarded ads.

Improved user feedback with SnackBar messages.

##Future Improvements
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

##Fork the repository.

Create a new branch for your feature or bugfix.

Commit your changes.

Push your branch and submit a pull request.

###License
This project is licensed under the MIT License. See the LICENSE file for details.
