import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview_Screen extends StatelessWidget {
  static late String url;
  Webview_Screen(url);

  static late WebViewController controller;

  @override
  static void initState(){
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://chrome.google.com/webstore/category/extensions'),
      );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller)
    );
  }
}
