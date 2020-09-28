import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class FacebookGoogleLogin extends StatelessWidget {
  final String title;
  final String selectedUrl;

  FacebookGoogleLogin({Key key, @required this.title, @required this.selectedUrl})
      : super(key: key);

  final Set<String> _urlSet = Set();
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    print ('--- website: $selectedUrl -----');
    return Scaffold(
      appBar: AppBar(title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: WebView(
        initialUrl: selectedUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) async {
          _controller = webViewController;
        },

        //navigationDelegate: _interceptNavigation,

        //onPageStarted: (String url) async { },
        //onPageFinished: (String url) {
	//  _urlSet.add(url);
        //},
        //onWebResourceError: (error) {},
        //initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.require_user_action_for_all_media_types,
      ),
    );
  }
  /// NavigationRequest: url, isForMainFrame
  /// NavigationDecision: navigate, prevent
  Future<NavigationDecision> _interceptNavigation(NavigationRequest request) async {
    NavigationDecision _navDecision = NavigationDecision.navigate;
    return _navDecision;
  }
}
