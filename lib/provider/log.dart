import 'package:flutter/material.dart';

class Log extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isDark = false;
  final _deviceType = TargetPlatform.iOS;

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

  setIsDark() {
    _isDark = true;
  }
}
