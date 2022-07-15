import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  List _name = [
    'Roberto Berry',
    'Ray Kavita',
    'Williams Kishi',
    'Meya Navid',
    'Xansa Ray',
    'Marall 20',
    'General Oklo',
    'Emma',
    'Nihad Ali',
    'Kali',
    'dany deep',
    'Roberto Berry',
    'Ray Kavita',
  ];
  List _photo = [
    '1.jpeg',
    '2.jpeg',
    '3.jpeg',
    '4.jpeg',
    '5.jpeg',
    '6.jpeg',
    '7.jpeg',
    '8.jpeg',
    '9.jpeg',
    '10.jpeg',
    '11.jpeg',
    '1.jpeg',
    '2.jpeg',
  ];
  List _topics = [
    'meet people',
    'psychology',
    'authors',
    'programming',
    'networking',
    'educatino',
    'algebra',
    'self driving cars',
    'physics',
    'mathematics',
    'geology',
    'love',
    'English',
  ];

  List _messages = [
    'ok bye',
    'sometimes i feel like i am not good',
    'in antoher side that is not good',
    'lets talk about something',
    'nevermind',
    'don\'t worry',
    'sorry, i gotta go',
    'self driving cars',
    'lights so bright when i see them',
    'why do people like to talk about themselves',
    'yes, it is true',
    'all right',
    'hello dude, how is it going?',
  ];

  get names {
    return _name;
  }

  get photos {
    return _photo;
  }

  get topics {
    return _topics;
  }

  get messages {
    return _messages;
  }
}
