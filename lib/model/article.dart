// To parse this JSON data, do
//
//     final articles = articlesFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

class Articles {
    Articles({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    final String status;
    final int totalResults;
    final List<Article> articles;

    factory Articles.fromRawJson(String str) => Articles.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

  var box = Hive.box('preference');

class Article {
    Article( {
      required this.source,
      this.author = '',
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage ,
      required this.publishedAt,
      this.content = '',
    }){
      this.isBookmarked = getIsBookmarked;
    }

    final Source source;
    final String? author;
    final String title;
    final String? description;
    final String url;
    final String urlToImage;
    final DateTime publishedAt;
    final String content;
    late bool isBookmarked;

    bool get getIsBookmarked{
    if (box.containsKey(url)) {
      return jsonDecode(box.get(url))['isBookmarked'];
    } else {
      return false;
    }
  }

    String get timeAgo {
      Duration diff = DateTime.now().difference(publishedAt);
      if(diff.inDays >= 1){
        return '${diff.inDays}d';
      } else if(diff.inHours >= 1){
        return '${diff.inHours}h';
      } else if(diff.inMinutes >= 1){
        return '${diff.inMinutes}m';
      } else if (diff.inSeconds >= 1){
        return '${diff.inSeconds}s';
      } else {
        return 'just now';
      }
    }

    factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null? null : json["author"],
        title: json["title"],
        description: json["description"]  == null ? null : json['description'],
        url: json["url"],
        urlToImage: json["urlToImage"] == null ? 'https://th.bing.com/th/id/OIP.hV6MoBaE8NYeMCugmhd7_QHaEo?pid=ImgDet&rs=1' : json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        // content: json["content"] == '' ? '' : json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        // "content": content == '' ? '' : content,
        "isBookmarked" : isBookmarked,
    };
}

class Source {
    Source({
      this.id = '',
      required this.name,
    });

    final String? id;
    final String name;

    factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == '' ? '0' : json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == '' ? '' : id,
        "name": name,
    };
}
