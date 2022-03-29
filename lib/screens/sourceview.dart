import 'package:flutter/material.dart';
import 'package:livenews/api/news.dart';
import 'package:livenews/article/view.dart';
import 'package:livenews/model/article.dart';

class SourceView extends StatefulWidget {
  final String source;
  const SourceView({ Key? key, required this.source, }) : super(key: key);

  @override
  _SourceViewState createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> with AutomaticKeepAliveClientMixin{

  late Future <Articles> sourceFuture;

  void initState() {
    sourceFuture = News.getArticles(source: widget.source);
    super.initState();
  }

  Future<void> onRefresh() async {
    sourceFuture = News.getArticles(source: widget.source);
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder <Articles> (
        future: sourceFuture,
        builder: (context, snapshot){
          if (snapshot.hasData) {
            var articles = snapshot.data!.articles;
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index){
                  return ArticleWidget(article: articles[index],);
                } 
              ),
            );
          } else {
            return Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator()
              ),
            );
          }
        }
      ); 
      // );
  }

  @override
  bool get wantKeepAlive => true;
}