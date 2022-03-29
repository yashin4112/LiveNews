import 'package:flutter/material.dart';
import 'package:livenews/api/news.dart';
import 'package:livenews/article/view.dart';
import 'package:livenews/model/article.dart';

class ArticlesWidget extends StatefulWidget {
  final String category;
  const ArticlesWidget({ Key? key, required this.category }) : super(key: key);

  @override
  _ArticlesWidgetState createState() => _ArticlesWidgetState();
}

class _ArticlesWidgetState extends State<ArticlesWidget> with AutomaticKeepAliveClientMixin<ArticlesWidget>{

  late Future<Articles> articlesFuture;

  @override
  void initState() {
    articlesFuture = News.getArticles(category: widget.category.toLowerCase());
    super.initState();
  }

  Future<void> onRefresh() async {
    articlesFuture = News.getArticles(category: widget.category.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Articles>(
      future: articlesFuture,
      builder: (context,snapshot){
        if (snapshot.hasData) {
        var articles = snapshot.data!.articles;
          return RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context,index){
                return ArticleWidget(
                  article: articles[index]
                );
              }
            ),
          );
        } else {
          return Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
          );
        }
      }
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}