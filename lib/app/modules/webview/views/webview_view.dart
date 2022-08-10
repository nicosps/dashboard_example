import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewView extends StatefulWidget {
  @override
  WebviewViewState createState() => WebviewViewState();
}

class WebviewViewState extends State<WebviewView> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            color: Color(0xFF2B637B),
          ),
        ),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'https://suitmedia.com/',
      ),
    );
  }
}
