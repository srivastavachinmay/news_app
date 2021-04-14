import 'package:flutter/material.dart';
import 'package:news_app/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        ),

      home: HomeScreen(),
    );
  }
}


