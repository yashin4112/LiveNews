import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Browser {
  static final ChromeSafariBrowser browser = ChromeSafariBrowser();

  static void launchURL(String url){
    browser.open(
      url: Uri.parse(url),
      options: ChromeSafariBrowserClassOptions(
        android: AndroidChromeCustomTabsOptions(
          toolbarBackgroundColor: Colors.blueGrey,
        )
      ),  
    );
  }
}