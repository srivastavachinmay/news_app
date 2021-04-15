import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:provider/provider.dart';

import 'newsCard.dart';

class NewsListView extends StatefulWidget {
  final String cat;

  NewsListView(this.cat);

  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  Future future;

  @override
  void initState() {
    // TODO: implement initState
    future = Provider.of<News>(context, listen: false).fetchNews(widget.cat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (ctx, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (dataSnapshot.error != null) {
            return Center(
              child: Text('An error occurred!'),
            );
          } else {
            return ListView.builder(
              itemCount: dataSnapshot.data.length,
              itemBuilder: (ctx, i) => NewsCard(dataSnapshot.data[i]),
            );
          }
        }
      },
    );
  }
}
