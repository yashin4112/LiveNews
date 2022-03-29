import 'package:flutter/material.dart';
import 'package:livenews/screens/widget/articles_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with AutomaticKeepAliveClientMixin<HomeView> {

  var categories = <String>[
    'General',
    'Business',
    'Health',
    'Sports',
    'Entertainment',
    'Technology',
    'Science'
  ];

   @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length, 
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home_outlined),
          title: Text('Live News'),
          bottom: TabBar(
            tabs: categories.map((tabName) => Tab(text: tabName,)).toList(),
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: categories.map((tabName) => ArticlesWidget(category: tabName)).toList()
        ),
      )
    );
  }
}