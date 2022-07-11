import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Thems extends ChangeNotifier {
  get isDark async {
    final prefs = await SharedPreferences.getInstance();

    bool? _isDark = prefs.getBool('ISDARK');
    return _isDark ?? false;
  }

  changeTheme() {
    return isDark ? ThemeData.dark() : ThemeData.light();
  }
}
