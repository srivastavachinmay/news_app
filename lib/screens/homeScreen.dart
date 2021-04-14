import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/models/categoryEnum.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Tab> _tabList = [
    Tab(
        child: Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              CategoryEnum.values[0]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              CategoryEnum.values[1]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              CategoryEnum.values[2]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              CategoryEnum.values[3]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              CategoryEnum.values[4]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              CategoryEnum.values[5]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
    Tab(
        child: Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              CategoryEnum.values[6]?.toString()?.split('.')?.elementAt(1),
              style: TextStyle(color: Colors.black),
            ))),
  ];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text("News App")),
        textTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
      ),
    );
  }
}
