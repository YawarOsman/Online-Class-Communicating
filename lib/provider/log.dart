import 'package:flutter/material.dart';

class Log extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isDark = true;
  final _deviceType = TargetPlatform.iOS;
  int _selectedTab = 4;

  get isLoggedIn {
    return _isLoggedIn;
  }

  get isDark {
    return _isDark;
  }

  set setLoggedIn(bool loggedIn) {
    _isLoggedIn = loggedIn;
  }

  set setDark(bool dark) {
    _isDark = dark;
  }

  get deviceType {
    return _deviceType;
  }

  get selectedTab {
    return _selectedTab;
  }

  void setSelectedTab(int selectedTab) {
    _selectedTab = selectedTab;
    notifyListeners();
  }

  setIsDark() {
    _isDark = true;
  }
}
