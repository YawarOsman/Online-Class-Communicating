import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../provider/log.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _pushNotifications = true;
  bool _messageNotifications = true;
  bool _roomNotifications = true;
  bool _otherNotifications = true;
  bool _fewerNotifications = false;
  int _themeModeIndex = 2;
  late int _themeModeIndexTemporary;

  @override
  Widget build(BuildContext context) {
    print(_themeModeIndex);
    return Consumer<Log>(
        builder: (context, log, child) => Scaffold(
            appBar: AppBar(
              iconTheme: Theme.of(context).iconTheme,
              textTheme: Theme.of(context).textTheme,
              actions: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(width: 13),
              ],
              toolbarHeight: 40,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notificatios',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Notifications(['Push Notifications', 'All Notifications'],
                        (bool value) {
                      _pushNotifications = !_pushNotifications;
                      if (_pushNotifications == false) {
                        _messageNotifications = false;
                        _roomNotifications = false;
                        _otherNotifications = false;
                      } else {
                        _messageNotifications = true;
                        _roomNotifications = true;
                        _otherNotifications = true;
                      }
                      setState(() {});
                    }, _pushNotifications),
                    Notifications(
                        ['Message Notifications', 'Messages Relating To Chats'],
                        (bool value) {
                      _messageNotifications = !_messageNotifications;
                      setState(() {});
                    }, _messageNotifications),
                    Notifications([
                      'Room Notifications',
                      'All Messages Relating To Rooms'
                    ], (bool value) {
                      _roomNotifications = !_roomNotifications;
                      setState(() {});
                    }, _roomNotifications),
                    Notifications(
                        ['Other Notifications', 'Events, New Followers, etc.'],
                        (bool value) {
                      _otherNotifications = !_otherNotifications;
                      setState(() {});
                    }, _otherNotifications),
                    Notifications([
                      'Fewer Notifications',
                      'This Will Send You Only Important Notifications'
                    ], (bool value) {
                      _fewerNotifications = !_fewerNotifications;
                      setState(() {});
                    }, _fewerNotifications),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'App Preferences',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppPreferences(
                        _themeModeIndex == 0
                            ? 'Dark Mode'
                            : _themeModeIndex == 1
                                ? 'Light Mode'
                                : 'System Mode', () {
                      _themeModeIndexTemporary = _themeModeIndex;
                      showDialog(
                        context: context,
                        builder: (ctx) => StatefulBuilder(
                          builder: (context, setState) => AlertDialog(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            contentPadding: EdgeInsets.only(bottom: 0),
                            actionsPadding: EdgeInsets.only(top: 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            content: Container(
                              margin:
                                  EdgeInsets.only(top: 13, left: 13, right: 13),
                              height: 185,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(children: [
                                GestureDetector(
                                  onTap: () => setState(() {
                                    _themeModeIndex = 0;
                                  }),
                                  child: Container(
                                    height: 35,
                                    width: double.infinity,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 13),
                                    margin: EdgeInsets.only(bottom: 8),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Dark Mode',
                                          style: TextStyle(
                                              color: _themeModeIndex == 0
                                                  ? Colors.green.shade600
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color),
                                        ),
                                        _themeModeIndex == 0
                                            ? Icon(Icons.check,
                                                color: Colors.green.shade600)
                                            : SizedBox()
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => setState(() {
                                    _themeModeIndex = 1;
                                  }),
                                  child: Container(
                                    height: 35,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 13),
                                    margin: EdgeInsets.only(bottom: 8),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Light Mode',
                                            style: TextStyle(
                                                color: _themeModeIndex == 1
                                                    ? Colors.green.shade400
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .color)),
                                        _themeModeIndex == 1
                                            ? Icon(Icons.check,
                                                color: Colors.green.shade600)
                                            : SizedBox()
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => setState(() {
                                    _themeModeIndex = 2;
                                  }),
                                  child: Container(
                                    height: 35,
                                    width: double.infinity,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 13),
                                    margin: EdgeInsets.only(bottom: 10),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'System Mode',
                                          style: TextStyle(
                                              color: _themeModeIndex == 2
                                                  ? Colors.green.shade400
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color),
                                        ),
                                        _themeModeIndex == 2
                                            ? Icon(Icons.check,
                                                color: Colors.green.shade600)
                                            : SizedBox()
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (_themeModeIndex == 0) {
                                          log.setIsDark(true);
                                        } else if (_themeModeIndex == 1) {
                                          log.setIsDark(false);
                                        } else if (_themeModeIndex == 2) {
                                          final sysMode = MediaQuery.of(context)
                                              .platformBrightness;
                                          Provider.of<Log>(context,
                                                  listen: false)
                                              .setIsDark(
                                                  sysMode == Brightness.dark);
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Theme.of(context).cardColor),
                                        child: Text('Apply'),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        _themeModeIndex =
                                            _themeModeIndexTemporary;
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Theme.of(context).cardColor),
                                        child: Text('Cancel'),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          ),
                        ),
                      );
                    }),
                    AppPreferences('Languages', () {}),
                    AppPreferences('Terms And Services', () {}),
                    AppPreferences('Privacy Policy', () {})
                  ],
                ),
              ),
            )));
  }

  Container Notifications(List text, Function? callback(bool val),
      [bool? switchValue]) {
    return Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Provider.of<Log>(context, listen: false).isDark
                ? Color.fromARGB(255, 34, 34, 34)
                : Color.fromARGB(255, 244, 244, 244)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text[0],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  text[1] != null
                      ? Text(
                          text[1],
                          style: TextStyle(fontSize: 10),
                        )
                      : SizedBox()
                ],
              ),
              switchValue != null
                  ? FlutterSwitch(
                      width: 40,
                      height: 24,
                      padding: 2,
                      toggleSize: 20,
                      value: switchValue,
                      onToggle: callback,
                    )
                  : SizedBox()
            ],
          ),
        ));
  }

  GestureDetector AppPreferences(String text, Function? callback()) {
    return GestureDetector(
      onTap: callback,
      child: Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Provider.of<Log>(context, listen: false).isDark
                  ? Color.fromARGB(255, 34, 34, 34)
                  : Color.fromARGB(255, 244, 244, 244)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
