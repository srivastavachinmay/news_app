import 'dart:ui';
import 'package:news_app/models/news.dart';
import 'package:news_app/widget/newsCard.dart';
import 'package:news_app/widget/newsListView.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/categoryEnum.dart';
import 'package:news_app/models/tabList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Tab> _tabList = TabList().tabList;
  TabController _tabController;
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<News>(context).fetchNews("business").then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                NewsListView(
                  CategoryEnum.values[0]?.toString()?.split('.')?.elementAt(1),
                ),
                NewsListView(
                  CategoryEnum.values[1]?.toString()?.split('.')?.elementAt(1),
                ),
                NewsListView(
                  CategoryEnum.values[2]?.toString()?.split('.')?.elementAt(1),
                ),
                NewsListView(
                  CategoryEnum.values[3]?.toString()?.split('.')?.elementAt(1),
                ),
                NewsListView(
                  CategoryEnum.values[4]?.toString()?.split('.')?.elementAt(1),
                ),
                NewsListView(
                  CategoryEnum.values[5]?.toString()?.split('.')?.elementAt(1),
                ),
                NewsListView(
                  CategoryEnum.values[6]?.toString()?.split('.')?.elementAt(1),
                ),
              ],
            ),
    );
  }
}
