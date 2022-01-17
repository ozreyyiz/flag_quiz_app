import 'package:flag_quiz/pages/mainpage.dart';
import 'package:flag_quiz/pages/mainpageup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flag Quiz',
      home: MainPageUp(),
    );
  }
}