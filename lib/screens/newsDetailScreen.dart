import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:provider/provider.dart';

class NewsDetailScreen extends StatelessWidget {
  static const routeName = "./detailScreen";

  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context).settings.arguments;
    final article = Provider.of<News>(
      context,
      listen: false,
    ).findById(title);
    print(article.title);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.teal,
              pinned: false,
              floating: true,
              // expandedHeight: 30.0,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text("Details"),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Text(
                    article.title==null?"NA":article.title,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: article.urlToImage == null
                        ? Image.asset("asset/default.jpeg")
                        : Image.network(
                            article.urlToImage,
                            fit: BoxFit.cover,
                          ),
                  ),
                  height: 200,
                  padding: EdgeInsets.all(10),
                ),
                Divider(
                  thickness: 5,
                  color: Colors.tealAccent,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  child: Text(
                      article.description==null?"NA":article.description,
                    style: TextStyle(fontSize: 20),
                  ),
                  padding: EdgeInsets.all(20),
                ),
                Divider(
                  thickness: 5,
                  color: Colors.tealAccent,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  child: Text(article.content==null?"NA":article.content),
                  padding: EdgeInsets.all(20),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
