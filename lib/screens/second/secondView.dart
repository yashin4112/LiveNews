import 'package:flutter/material.dart';
import 'package:livenews/model/sources.dart';

import '../sourceview.dart';

class SecondView extends StatefulWidget  {
  const SecondView({ Key? key }) : super(key: key);

  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> with AutomaticKeepAliveClientMixin<SecondView> {
  var sources= <Source>[
    // 'the-hindu',
    // 'google-news-in',
    // 'the-times-of-india',
    Source(
      name: 'The Hindu',
      id: 'the-hindu'
    ),
    Source(
      name: 'Google News', 
      id: 'google-news-in'
    ),
    Source(
      name: 'TOI', 
      id: 'the-times-of-india'
    )
  ];

   @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length, 
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.source_outlined),
          title: Text('Sources'),
          bottom: TabBar(
          tabs: sources.map((source) => Tab(text: source.name,)).toList(),
          isScrollable: false,
        ),
        ),
         body: TabBarView(
           physics: NeverScrollableScrollPhysics(),
           children: sources.map((source) => SourceView(source: source.id)).toList(),
         )
      )
    );
  }
}