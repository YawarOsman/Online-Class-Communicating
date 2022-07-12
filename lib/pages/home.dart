import 'package:english_tech/models/appbar.dart';
import 'package:english_tech/models/botton_tabbar.dart';
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

  @override
  Widget build(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _swidth = _mediaQueryData.size.width;
    _sheight = _mediaQueryData.size.height;
    _theme = Theme.of(context);

    return Consumer2<Data, Log>(
      builder: (context, consumer, consumer2, child) => Scaffold(
          drawer: Profile(),
          bottomSheet: BottomBar(
            theme: _theme,
          ),
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 47),
            child: AppBarModel(
              theme: _theme,
            ),
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _roomSelected = true;
                      setState(() {});
                    },
                    child: Opacity(
                      opacity: _roomSelected ? 1 : 0.9,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          alignment: Alignment.center,
                          width: _swidth / 2 - 20,
                          height: 35,
                          decoration: BoxDecoration(
                              color: _roomSelected
                                  ? Colors.green.shade600
                                  : Colors.green.shade200,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Rooms',
                            style: TextStyle(
                                fontSize: 15,
                                color: _roomSelected
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _roomSelected = false;
                      setState(() {});
                    },
                    child: Opacity(
                      opacity: _roomSelected ? 0.9 : 1,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          alignment: Alignment.center,
                          width: _swidth / 2 - 20,
                          height: 35,
                          decoration: BoxDecoration(
                              color: _roomSelected
                                  ? Colors.green.shade200
                                  : Colors.green.shade600,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Learning',
                            style: TextStyle(
                                fontSize: 15,
                                color: _roomSelected
                                    ? Colors.black
                                    : Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.only(bottom: 17, left: 13, right: 13),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                      alignment: Alignment.center,
                      width: _swidth / 2 - 20,
                      height: 145,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/${consumer.photos[index]}'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      consumer.names[index],
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  splashColor: Colors.transparent,
                                  child: Icon(
                                    Icons.more_vert,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Stack(
                                      // overflow: Overflow.visible,

                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundImage: AssetImage(
                                              'assets/images/${consumer.photos[consumer.photos.length - index - 1]}'),
                                        ),
                                        Positioned(
                                          left: 17,
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundImage: AssetImage(
                                                'assets/images/${consumer.photos[consumer.photos.length - index - 2]}'),
                                          ),
                                        ),
                                        Positioned(
                                          left: 8,
                                          top: 10,
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundImage: AssetImage(
                                                'assets/images/${consumer.photos[consumer.photos.length - index - 3]}'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 23,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person_outline,
                                          size: 13,
                                        ),
                                        Text(consumer.names.length.toString(),
                                            style: TextStyle(fontSize: 11))
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 70,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: consumer.names.length <= 3
                                          ? consumer.names.length
                                          : 3,
                                      itemBuilder: (context, _index) =>
                                          Text(consumer.names[_index]),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ),
            )
          ])),
    );
  }
}
