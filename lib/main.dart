
import 'package:flutter/material.dart';
import 'package:task/Screen/Home_Page.dart';

void main() {
  runApp(MyApp());
  // await AndroidAlarmManager.initialize();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

