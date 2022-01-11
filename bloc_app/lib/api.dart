import 'dart:convert';

import 'package:bloc_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'models/news_model.dart';

class Api {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsmodel;

    try {
      var response = await get(Uri.parse(Constants.news_url));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonmap = json.decode(jsonString);
        newsmodel = NewsModel.fromJson(jsonmap);
      }
    } catch (Exception) {
      return newsmodel;
    }
    return newsmodel;
  }
}
