import 'package:english_tech/pages/home.dart';
import 'package:english_tech/pages/SingIn-with-phone.dart';
import 'package:english_tech/pages/profile.dart';
import 'package:english_tech/provider/data.dart';
import 'package:english_tech/provider/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/Welcome.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(),
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        bottomAppBarColor: Colors.white,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 24, 24, 24),
        colorScheme: ColorScheme.dark(),
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
        appBarTheme:
            AppBarTheme(backgroundColor: Color.fromARGB(255, 24, 24, 24)),
        bottomAppBarColor: Colors.grey.shade900,
      ),
      initialRoute: '/',
      routes: {
        '/phone': (context) => SignInWithPhone(),
        '/home': (context) => Home(),
        '/profile': (context) => Profile()
      },
      home: Home(),
    );
  }
}
