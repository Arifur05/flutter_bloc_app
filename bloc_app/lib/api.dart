import 'dart:convert';

import 'package:bloc_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'models/news_model.dart';

class Api {
  /* Future<NewsModel> getNews() async {
    final response = await get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=777e85d1704c4208b87adb6b9ccc6cf1'));
    final news = newsModelFromJson(response.body);
    print("$news");
    return news;
  }*/
 static Future<NewsModel> getNews() async {
    var response = await get(Uri.parse(Constants.news_url));
    print("print");
    print(response.body);
    if (response.statusCode == 200) {

      return newsModelFromJson(response.body);
    } else {
      throw Exception('Failed to get');
    }

    //return newsmodel;
  }
}
