import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingView extends StatefulWidget {
  const SettingView({ Key? key }) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  
  var box = Hive.box('preference');
  late String theme;
  var supportedTheme = [
    'Light Theme',
    'Dark Theme',
    'System Default',
  ];

  @override
  void initState() {
   theme = box.get('themeMode') ?? 'Light Theme';
    super.initState();
  }

  void onThemeChanged(String currentTheme){
    switch (currentTheme) {
      case 'Light Theme':
        AdaptiveTheme.of(context).setLight();
        break;
      case 'Dark Theme':
        AdaptiveTheme.of(context).setDark();
        break;
      case 'System Default':
        AdaptiveTheme.of(context).setSystem();
        break;    
      default:
    }
    box.put('themeMode', currentTheme);
    setState(() => theme = currentTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings_outlined),
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var item in supportedTheme) 
              ListTile(
                title: Text(item),
                onTap: () => onThemeChanged(item),
                trailing: Visibility(
                  visible: theme == item,
                  child: Icon(
                    Icons.check_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
          ]
        )  
      ),
    );
  }
}