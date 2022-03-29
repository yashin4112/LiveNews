import 'package:flutter/material.dart';
import 'package:livenews/article/view.dart';
import 'package:livenews/model/article.dart';
import 'package:http/http.dart' as http;

class ArticleView extends StatefulWidget {
  const ArticleView({ Key? key }) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  late Future <Articles> articleFuture;

  Future<Articles>getArticles() async {
    var country = 'in';
    var apiKey = '61b925eb2a7040ed9a4b1575dddcaee5';
    var uri = Uri(
      scheme: 'https',
      host: 'newsapi.org',
      path: '/v2/top-headlines',
      queryParameters: {
        'country':country,
        'apikey':apiKey,
        },
        
      );
      print(uri);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return Articles.fromRawJson(response.body);
    } else {
      return Articles(
        status: 'fail', 
        totalResults: 0, 
        articles: []
      );
    }  
  }

  @override
  void initState() {
    articleFuture = getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home_outlined),
        title: Text('Live News'),
      ),
      body:
      FutureBuilder <Articles> (
        future: articleFuture,
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.articles.length,
              itemBuilder: (context, index){
                return ArticleWidget(article: snapshot.data!.articles[index]);
              } 
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
        ),
        
    );
  }
}