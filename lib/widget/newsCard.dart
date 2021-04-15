import 'package:flutter/material.dart';
import 'package:news_app/models/NewsModel.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  NewsCard(this.article);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          article.title,
          maxLines: 3,
        ),
        leading: Container(
            width: 100,
            height: 100,
            child: article.urlToImage == null
                ? Image.asset("asset/default.jpeg")
                : Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, exception, stackTrace) =>
                        Image.asset("asset/default.jpeg"),
                  )),
      ),
    );
  }
}
