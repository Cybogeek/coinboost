import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../provider/reward_level_provider.dart';
import '../provider/task_provider.dart';
import '../widgets/bottom_navigation.dart';
import '../utils/ads_helper.dart'; // Ensure this file exists for ad unit IDs

class TaskShowPage extends StatefulWidget {
  final String taskType; // 'news' or 'game'
  final String taskImage;

  const TaskShowPage({
    super.key,
    required this.taskType,
    required this.taskImage,
  });

  @override
  State<TaskShowPage> createState() => _TaskShowPageState();
}

class _TaskShowPageState extends State<TaskShowPage> {
  late Timer _interactionTimer;
  late Timer _taskTimer;
  RewardedAd? _rewardedAd;
  bool _isRewardedAdLoaded = false;
  bool _showFloatingContainer = true;

  @override
  void initState() {
    super.initState();
    _initializeTaskTracking();
    _loadRewardedAd();
  }

  void _initializeTaskTracking() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final taskProvider = Provider.of<TaskProvider>(context, listen: false);
      taskProvider.startTask();

      // Track interaction every 30 seconds
      _interactionTimer = Timer.periodic(Duration(seconds: 30), (timer) {
        taskProvider.updateInteraction();
      });

      // Check rules every minute
      _taskTimer = Timer.periodic(Duration(minutes: 1), (timer) {
        taskProvider.checkRules();
        if (taskProvider.isRule1Followed &&
            taskProvider.isRule2Followed &&
            taskProvider.isRule3Followed) {
          _awardUser();
          _interactionTimer.cancel();
          _taskTimer.cancel();
        }
      });
    });
  }

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _rewardedAd = ad;
            _isRewardedAdLoaded = true;
          });
        },
        onAdFailedToLoad: (error) {
          print('Failed to load rewarded ad: $error');
        },
      ),
    );
  }

  void _showRewardedAd() {
    if (_rewardedAd != null && _isRewardedAdLoaded) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _loadRewardedAd(); // Load a new ad
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          print('Failed to show rewarded ad: $error');
          ad.dispose();
          _loadRewardedAd(); // Load a new ad
        },
      );

      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          // Schedule the state update after the current frame
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final rewardProvider = Provider.of<RewardLevelProvider>(
              context,
              listen: false,
            );
            rewardProvider.updateEarnings('Level 01', reward.amount.toDouble());

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('You earned ${reward.amount} points!')),
            );

            // Hide the floating container after claiming the reward
            setState(() {
              _showFloatingContainer = false;
            });
          });
        },
      );
    } else {
      print('Rewarded ad not loaded');
    }
  }

  @override
  void dispose() {
    _interactionTimer.cancel();
    _taskTimer.cancel();
    _rewardedAd?.dispose();
    super.dispose();
  }

  void _awardUser() {
    final rewardProvider = Provider.of<RewardLevelProvider>(
      context,
      listen: false,
    );

    if (widget.taskType == 'news') {
      rewardProvider.updateEarnings('Level 01', 8); // Award 8 rupees for news
    } else if (widget.taskType == 'game') {
      rewardProvider.updateEarnings('Level 01', 5); // Award 5 rupees for game
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Task completed! You earned ${widget.taskType == 'news' ? 8 : 5} rupees.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text(
      //   //   widget.taskType == 'news' ? 'Read News' : 'Play Game',
      //   //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //   // ),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Task Image
                // Center(child: Image.asset(widget.taskImage, width: 250)),
                // SizedBox(height: 20),

                // Task Content
                Expanded(
                  child:
                      widget.taskType == 'news'
                          ? _buildNewsContent()
                          : _buildGameContent(),
                ),

                // Rules Status
                Text(
                  'Rules Status:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rule 1: ${taskProvider.isRule1Followed ? "Completed" : "Pending"}',
                ),
                Text(
                  'Rule 2: ${taskProvider.isRule2Followed ? "Completed" : "Pending"}',
                ),
                Text(
                  'Rule 3: ${taskProvider.isRule3Followed ? "Completed" : "Pending"}',
                ),
              ],
            ),
          ),

          // Floating Container for Claiming 10 Points
          if (_showFloatingContainer)
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                height: 85,
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha(125),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Close Icon
                    IconButton(
                      icon: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          _showFloatingContainer = false; // Hide the container
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      '10.0',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    // Claim Button
                    ElevatedButton(
                      onPressed: () {
                        _showRewardedAd(); // Show rewarded ad
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.black),

                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Claim'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(identifier: 1),
    );
  }

  // News Content
  Widget _buildNewsContent() {
    return Image.asset('assets/images/news_page.png');

    // ListView(
    //   children: [
    //     Text('Local News Content or API Data'),
    //     // Add more news content here
    //   ],
    // );
  }

  // Game Content
  Widget _buildGameContent() {
    return Center(child: Text('Demo Game Content'));
  }
}
