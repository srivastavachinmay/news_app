import 'package:flutter/material.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:provider/provider.dart';

import 'models/news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: News('business'),
        ),
      ],
      child:MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
