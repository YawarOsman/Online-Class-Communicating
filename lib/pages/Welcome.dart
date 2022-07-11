import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late MediaQueryData mediaQueryData;
  late double swidth;
  late double sheight;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    swidth = mediaQueryData.size.width;
    sheight = mediaQueryData.size.height;
    theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Text(
              'Welcome to App House',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Text(
                  'App House',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber.shade600),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 120),
                child: Text(
                  'this is an online application to learn english and communication withpeople all over the world and learn other languages',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'login with',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Container(
                  width: swidth / 2.5,
                  height: 33,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: theme.iconTheme.color,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    'Email & Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Navigator.of(context).pushNamed('/phone');
                },
                child: Container(
                  width: swidth / 2.5,
                  height: 33,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: theme.iconTheme.color,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Container(
                  width: swidth / 2.5,
                  height: 33,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: theme.iconTheme.color,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          width: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Google',
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
