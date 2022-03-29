import 'package:flutter/material.dart';
import 'package:livenews/screens/bookmarks/view.dart';
import 'package:livenews/screens/second/secondView.dart';
import 'package:livenews/screens/settings/view.dart';
import 'package:livenews/screens/widget/view.dart';

class TabView extends StatefulWidget {
  const TabView({ Key? key }) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {

  var currentIndex = 0;
  var tabWidgets = [
    HomeView(key: PageStorageKey('home'),),
    SecondView(key: PageStorageKey('second')),
    BookmarksView(),
    SettingView(),
  ];
  
  Widget bookmarkView() => BookmarksView();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: tabWidgets[currentIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(
            Icons.home_outlined),
            label:'Home',
            ),
            BottomNavigationBarItem(icon: Icon(
            Icons.source_outlined),
            label:'Sources',
            ),
            BottomNavigationBarItem(icon: Icon(
            Icons.bookmark_border_outlined),
            label:'Bookmarks',
            ),
            BottomNavigationBarItem(icon: Icon(
            Icons.settings_outlined),
            label:'Settings',
            ),
        ],
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
       ),
    );
  }
}