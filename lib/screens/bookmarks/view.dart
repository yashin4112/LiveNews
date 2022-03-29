import 'package:flutter/material.dart';
import 'package:livenews/api/news.dart';
import 'package:livenews/article/view.dart';
import 'package:livenews/model/article.dart';

class BookmarksView extends StatefulWidget {
  const BookmarksView({ Key? key }) : super(key: key);

  @override
  _BookmarksViewState createState() => _BookmarksViewState();
}

class _BookmarksViewState extends State<BookmarksView> {

  List<Article> articles = [];

  @override
  void initState() {
    setState(() => articles.addAll(News.getBookmarkedArticle()));
    super.initState();
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
        leading: Icon(Icons.bookmark_border_outlined),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context,index) => ArticleWidget(article: articles[index]),
      ),
    );
  }
}