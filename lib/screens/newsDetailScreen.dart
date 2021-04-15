import 'package:flutter/material.dart';
import 'package:news_app/models/newsModel.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  NewsDetailScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: true,
          expandedHeight: 160.0,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text("Details"),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Text(
              article.title,
              overflow: TextOverflow.clip,
            ),
            Container(
              child: article.urlToImage == null
                  ? AssetImage("assets/default.jfif")
                  : Image.network(
                      article.urlToImage,
                      fit: BoxFit.cover,
                    ),
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ],
    ));
  }
}
