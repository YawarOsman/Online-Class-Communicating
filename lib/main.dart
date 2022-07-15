import 'package:english_tech/pages/home.dart';
import 'package:english_tech/pages/SingIn-with-phone.dart';
import 'package:english_tech/pages/profile.dart';
import 'package:english_tech/pages/search.dart';
import 'package:english_tech/pages/searchDetails.dart';
import 'package:english_tech/pages/settings.dart';
import 'package:english_tech/provider/data.dart';
import 'package:english_tech/provider/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/messages.dart';

void main() {
  runApp(MultiProvider(providers: [
    ListenableProvider(create: (context) => Data()),
    ListenableProvider(create: (context) => Log())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'English Tech',
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 116, 116, 116),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.light(),
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          cardColor: Color.fromARGB(255, 244, 244, 244)),
      darkTheme: ThemeData(
        primaryColor: Color.fromARGB(255, 125, 125, 125),
        scaffoldBackgroundColor: Color.fromARGB(255, 24, 24, 24),
        colorScheme: ColorScheme.dark(),
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
        appBarTheme:
            AppBarTheme(backgroundColor: Color.fromARGB(255, 24, 24, 24)),
        cardColor: Color.fromARGB(255, 34, 34, 34),
      ),
      themeMode:
          Provider.of<Log>(context).isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/phone': (context) => SignInWithPhone(),
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
        '/settings': (context) => Settings(),
        '/search': (context) => Search(),
        '/messages': (context) => Messages(),
      },
      home: Home(),
    );
  }
}
