import 'package:english_tech/provider/log.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key, required this.theme}) : super(key: key);
  final ThemeData theme;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _bottonAppBarSelectedIndex = 4;
  double _roomSize = 40;

  @override
  Widget build(BuildContext context) {
    return Consumer<Log>(
      builder: (context, consumer, child) => Container(
        color: widget.theme.scaffoldBackgroundColor,
        padding: EdgeInsets.only(bottom: 10),
        child: FlashyTabBar(
            iconSize: 25,
            backgroundColor: widget.theme.scaffoldBackgroundColor,
            showElevation: false,
            selectedIndex: _bottonAppBarSelectedIndex,
            onItemSelected: (value) {
              _bottonAppBarSelectedIndex = value;
              if (value == 2) {
                _roomSize = 20;
              } else {
                _roomSize = 40;
              }
              consumer.setSelectedTab(value);

              setState(() {});
            },
            items: [
              tabBarItem(context, 'classes', Icons.class_sharp),
              tabBarItem(context, 'events', Icons.event_sharp),
              FlashyTabBarItem(
                  icon: Icon(Icons.add,
                      size: _roomSize, color: Colors.green.shade700),
                  title: Text('room'),
                  activeColor: Colors.green.shade700,
                  inactiveColor: Colors.black54),
              tabBarItem(context, 'alerts', Icons.notification_add),
              tabBarItem(context, 'home', Icons.home),
            ]),
      ),
    );
  }

  FlashyTabBarItem tabBarItem(
      BuildContext context, String name, IconData icon) {
    return FlashyTabBarItem(
        icon: Icon(icon),
        title: Text(name),
        activeColor: Colors.green.shade700,
        inactiveColor:
            Provider.of<Log>(context).isDark ? Colors.white : Colors.black);
  }
}
