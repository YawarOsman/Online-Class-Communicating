import 'package:flutter/material.dart';

class AppBarModel extends StatefulWidget {
  AppBarModel({Key? key, required this.theme}) : super(key: key);
  final ThemeData theme;

  @override
  State<AppBarModel> createState() => _AppBarModelState();
}

class _AppBarModelState extends State<AppBarModel> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: CircleAvatar(
                radius: 17.0,
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
            ),
            SizedBox(
              width: 11,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  Icons.message_outlined,
                  size: 22,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  Icons.search_sharp,
                  size: 23,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ]),
          Text(
            'App House',
            style: TextStyle(
                color: widget.theme.textTheme.bodyText1!.color,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      titleSpacing: 13,
      leadingWidth: 0,
      toolbarHeight: 47,
      automaticallyImplyLeading: false,
      iconTheme: widget.theme.iconTheme,
      toolbarTextStyle: TextStyle(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white),
    );
  }
}
