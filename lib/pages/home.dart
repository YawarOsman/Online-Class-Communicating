import 'package:english_tech/models/appbar.dart';
import 'package:english_tech/models/botton_tabbar.dart';
import 'package:english_tech/pages/mainPage.dart';
import 'package:english_tech/provider/data.dart';
import 'package:english_tech/provider/log.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ThemeData _theme;
  late MediaQueryData _mediaQueryData;
  late double _swidth;
  late double _sheight;
  bool _roomSelected = true;
  List _list = [
    // Center with a Text widget in 4 orders
    Scaffold(
      body: Center(
        child: Text('classes'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('events'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('add'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('alerts'),
      ),
    ),
    MainPage(),
  ];

  @override
  Widget build(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _swidth = _mediaQueryData.size.width;
    _sheight = _mediaQueryData.size.height;
    _theme = Theme.of(context);

    return Consumer<Log>(
        builder: ((context, consumer, child) => Scaffold(
              bottomSheet: BottomBar(theme: _theme),
              body: _list.elementAt(consumer.selectedTab),
            )));
  }
}
