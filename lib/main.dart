import 'package:flutter/material.dart';
import 'Home.dart';
import 'nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorldSafe',
      theme: ThemeData(
        fontFamily: 'ProductSans',
        backgroundColor: Colors.grey.shade300,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

