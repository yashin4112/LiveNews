import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:livenews/api/request.dart';
import 'package:livenews/model/article.dart';

class News {
  static var apikey = '61b925eb2a7040ed9a4b1575dddcaee5';
  static var country = 'in';

  static Future<Articles> getArticles({String category = 'general', String source = ''}) async {
    var uri = Uri(
      host: 'newsapi.org',
      scheme: 'https',
      path: '/v2/top-headlines',
      queryParameters: {
        'country': source == '' ? country : '',
        'apikey': apikey,
        'category':source == '' ? category : '',
        'sources':source
      }
    );
    var response = await Request.makeRequest(uri: uri);
    if (response != null) {
      return Articles.fromRawJson(response);
    } else {
      return Articles(status: 'failed', totalResults: 0, articles: []);
    }
  } 

  static List<Article> getBookmarkedArticle(){
    List<Article> articles = [];
    var box = Hive.box('preference');
    box.keys.forEach((element) {
      if (element.toString().startsWith('https')) {
        var data = box.get(element);
        if (jsonDecode(data)['isBookmarked']) {
          articles.add(Article.fromRawJson(data));
        }
      } 
    });
    articles.sort(
      (a, b) => b.publishedAt.compareTo(a.publishedAt)
    );
    return articles;
  } 
}