import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  bool _isRule1Followed = false;
  bool _isRule2Followed = false;
  bool _isRule3Followed = false;
  DateTime? _lastInteractionTime;
  DateTime? _taskStartTime;

  bool get isRule1Followed => _isRule1Followed;
  bool get isRule2Followed => _isRule2Followed;
  bool get isRule3Followed => _isRule3Followed;

  // Track user interaction
  void updateInteraction() {
    _lastInteractionTime = DateTime.now();
    notifyListeners();
  }

  // Start task timer
  void startTask() {
    _taskStartTime = DateTime.now();
    notifyListeners();
  }

  // Check if rules are followed
  void checkRules() {
    final now = DateTime.now();
    if (_taskStartTime != null) {
      // Rule 1: Keep scrolling for 10 minutes
      _isRule1Followed = now.difference(_taskStartTime!).inMinutes >= 10;

      // Rule 2: Keep interacting every 30 seconds
      if (_lastInteractionTime != null) {
        _isRule2Followed =
            now.difference(_lastInteractionTime!).inSeconds <= 30;
      }

      // Rule 3: Don't leave the screen idle for more than 30 seconds
      _isRule3Followed = _isRule2Followed; // Same as Rule 2 for now
    }
    notifyListeners();
  }

  // Reset task tracking
  void resetTask() {
    _isRule1Followed = false;
    _isRule2Followed = false;
    _isRule3Followed = false;
    _lastInteractionTime = null;
    _taskStartTime = null;
    notifyListeners();
  }
}
