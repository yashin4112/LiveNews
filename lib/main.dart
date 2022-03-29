import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:livenews/core/thems.dart';
import 'package:livenews/tabs/tabView.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('preference');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: Themes.lightTheme, 
      dark: Themes.darkTheme,
      initial: AdaptiveThemeMode.light, 
      builder: (theme, darktheme) =>MaterialApp(
        title: 'Live News',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darktheme,
        home: TabView(),
      )
    );
  }
}
