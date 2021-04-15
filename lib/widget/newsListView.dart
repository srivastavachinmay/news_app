import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/newsModel.dart';
import 'package:provider/provider.dart';


import 'newsCard.dart';

class NewsListView extends StatefulWidget {
  final String cat;

  NewsListView(this.cat);

  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  bool _isInit = true;
  bool _isLoading = false;

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // _tabController = TabController(length: _tabList.length, vsync: this);
  // }

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<News>(context).fetchNews(widget.cat).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<News>(context);
    var list=data.articles;
    // News news;
    return
        // FutureBuilder(
        // future: Provider.of<News>(context).fetchNews(widget.cat),
        // builder: (ctx, dataSnapshot) {
        //   // var help=dataSnapshot.data;
        //   // print(help);
        //   if (dataSnapshot.connectionState == ConnectionState.waiting) {
        //     return Center(child: CircularProgressIndicator());
        //   } else {
        //     if (dataSnapshot.error != null) {
        //       // ...
        //       // Do error handling stuff
        //       return Center(
        //         child: Text('An error occurred!'),
        //       );
        //     } else {
        //       return Consumer<News>(
        //         builder: (ctx, newsArticle, child) =>
        ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx, i) => NewsCard(list[i]),
    );
  }
}
