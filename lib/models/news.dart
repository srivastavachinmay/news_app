import 'package:news_app/models/NewsModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class News{
  String cat;
  News(this.cat);
  Future<void> fetchNews(String cat) async{
    var url="https://newsapi.org/v2/top-headlines?sortBy=popularity&category=$cat&apiKey=3a94ba87ff884d1287b8e778419699cd";
      try {
        final response = await http.get(Uri.parse(url));
        NewsModel newsModel=NewsModel.fromJson(json.decode(response.body));
      } on Exception catch (e) {
        // TODO
      }

    
  }
}