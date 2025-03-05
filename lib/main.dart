import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/bottomnav_provider.dart';
import 'provider/reward_level_provider.dart';
import 'provider/task_provider.dart';
import 'screens/splash_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RewardLevelProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xFFF7931A),
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF7931A)),
        ),

        home: SplashScreen(),
      ),
    );
  }
}
