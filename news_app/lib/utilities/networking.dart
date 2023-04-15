import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news.dart';

class NetworkHelper {
  static final String url =
      'http://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=aa67d8d98c8e4ad1b4f16dbd5f3be348';

  static Future<List<News>?> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = response.body;
      final decodedData = jsonDecode(data);
      final articles = decodedData['articles'];
      List<News> news = [];
      for (var article in articles) {
        try {
          news.add(News.fromJson(article));
        } catch (e) {
          print(e);
        }
      }
      return news;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
