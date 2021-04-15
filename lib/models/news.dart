import 'package:flutter/cupertino.dart';
import 'package:news_app/models/NewsModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class News with ChangeNotifier {
  final String cat;

  News(this.cat);

  List<Article> _articles = [];

  List<Article> get articles => _articles;

  Future<void> fetchNews(String cat) async {
    var url =
        "https://newsapi.org/v2/top-headlines?pageSize=100&sortBy=popularity&category=$cat&country=in&apiKey=3a94ba87ff884d1287b8e778419699cd";
    try {
      final response = await http.get(Uri.parse(url));
      NewsModel newsModel = NewsModel.fromJson(json.decode(response.body));
      _articles = newsModel.articles;
      print(_articles.length);
      notifyListeners();
    } on Exception catch (e) {
      // TODO
    }
  }
}
