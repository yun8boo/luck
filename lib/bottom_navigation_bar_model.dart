import 'package:flutter/material.dart';

class BottomNavigationBarModel with ChangeNotifier {
  int _currentIndex = 0;
  get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    // View側に変更を通知
    notifyListeners();
  }
}
