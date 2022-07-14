import 'dart:io';

import 'package:english_tech/models/botton_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/data.dart';
import '../provider/log.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late MediaQueryData mediaQueryData;
  late double swidth;
  late double sheight;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    swidth = mediaQueryData.size.width;
    sheight = mediaQueryData.size.height;

    return Consumer2<Data, Log>(
      builder: (context, data, log, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                gradient: LinearGradient(
                    colors: [Colors.green.shade700, Colors.green.shade400]),
              ),
            ),
            leading: Platform.isIOS
                ? GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                    ),
                  )
                : SizedBox(),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.bookmark_outline,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          log.deviceType == TargetPlatform.iOS
                              ? Icons.ios_share_outlined
                              : Icons.share_outlined,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                        child: Icon(
                          Icons.settings_outlined,
                          size: 25,
                        ),
                      ),
                    ]),
              ),
            ],
            iconTheme: Theme.of(context).iconTheme,
            textTheme: Theme.of(context).textTheme,
            toolbarHeight: 40,
            titleSpacing: 0,
          ),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 87,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.shade700,
                            Colors.green.shade400
                          ],
                        ),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(50))),
                    margin: EdgeInsets.only(bottom: 60),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Adia Williams',
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'adiawilliams@gmail.com',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '0',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        ' rooms',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '12',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        ' following',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '8',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        ' followers',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius:
                              mediaQueryData.orientation == Orientation.portrait
                                  ? swidth / 7.3
                                  : sheight / 6.5,
                          backgroundImage:
                              AssetImage('assets/images/profile.jpeg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 13, left: 35, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Be a girl with a mind, a woman with attitude, and a lady with class.',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 35),
                      child: Visibility(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            '+ add social link',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.green.shade600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rooms you\'re admin in',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          'Show All',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 185,
                    padding: EdgeInsets.only(left: 10),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.names.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 13),
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    width: swidth / 2.5,
                                    alignment: Alignment.bottomCenter,
                                    padding: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: log.isDark
                                          ? Color.fromARGB(255, 34, 34, 34)
                                          : Color.fromARGB(255, 244, 244, 244),
                                    ),
                                    child: index > 0
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    data.names[index],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    '3 room weekly',
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: log.isDark
                                                            ? Color.fromARGB(
                                                                255,
                                                                105,
                                                                105,
                                                                105)
                                                            : Color.fromARGB(
                                                                255,
                                                                66,
                                                                66,
                                                                66)),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                alignment: Alignment.topCenter,
                                                width: swidth / 2.5,
                                                height: 95,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          'assets/images/${data.photos[index]}')),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  color: Colors.green.shade800,
                                                ),
                                                Text(
                                                  'Create new room',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors
                                                          .green.shade800),
                                                ),
                                              ],
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                  ),
                                ),
                              ),
                            )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rooms you\'re in',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          'Show All',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 185,
                    padding: EdgeInsets.only(left: 10),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.names.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 13),
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    width: swidth / 2.5,
                                    alignment: Alignment.bottomCenter,
                                    padding: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: log.isDark
                                          ? Color.fromARGB(255, 34, 34, 34)
                                          : Color.fromARGB(255, 244, 244, 244),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              data.names[index],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              '3 room weekly',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: log.isDark
                                                      ? Color.fromARGB(
                                                          255, 105, 105, 105)
                                                      : Color.fromARGB(
                                                          255, 66, 66, 66)),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          alignment: Alignment.topCenter,
                                          width: swidth / 2.5,
                                          height: 95,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/images/${data.photos[index]}')),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20, left: 13),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Topics to Follow',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: swidth,
                          child: Wrap(
                            children: List.generate(
                                data.topics.length,
                                (index) => Container(
                                      margin:
                                          EdgeInsets.only(right: 13, top: 13),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 13, vertical: 3),
                                      decoration: BoxDecoration(
                                          color: log.isDark
                                              ? Color.fromARGB(255, 34, 34, 34)
                                              : Color.fromARGB(
                                                  255, 244, 244, 244),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        data.topics[index],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ))
                              ..add(Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    child: Row(
                                      children: [
                                        Text('Show all topics'),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          ))
                    ]),
              )
            ]),
          )),
    );
  }
}
