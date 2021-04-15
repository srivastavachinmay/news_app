import 'package:flutter/cupertino.dart';
import 'package:news_app/models/NewsModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';


class News with ChangeNotifier {
  final String cat;

  News(this.cat);

  List<Article> _articles = [];
  Article findById(String id) {
    return _articles.firstWhere((prod) => prod.title == id);
  }

  Future<List<Article>> fetchNews(String cat) async {
    var url =
        "https://newsapi.org/v2/top-headlines?pageSize=100&sortBy=popularity&category=$cat&country=in&apiKey=b7ab339381f047a9963fba426dd891f7";
    try {
      final response = await http.get(Uri.parse(url));
      NewsModel newsModel = NewsModel.fromJson(json.decode(response.body));
      _articles = newsModel.articles;
    } on Exception catch (e) {
      // TODO
    }
    return _articles;
  }
}
