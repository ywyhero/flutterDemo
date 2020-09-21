import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const CATCH_URLS = [
  'm.ctrip.com/',
  'm.ctrip.com/html5/',
  'm.ctrip.com/html5',
  'm.ctrip.com/html5/you/',
  'm.ctrip.com/webapp/you/foods/',
  'm.ctrip.com/webapp/vacations/tour/list'
];

class WebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;
  final bool hideHead;

  WebView({this.title, this.hideAppBar, this.url, this.backForbid, this.hideHead = false, this.statusBarColor});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final webViewReference = new FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChange;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  bool exiting = false;
  @override
  void initState() {
    webViewReference.close();
    _onUrlChange = webViewReference.onUrlChanged.listen((String url) { });
    _onStateChanged = webViewReference.onStateChanged.listen((WebViewStateChanged state) {
      switch(state.type) {
        case WebViewState.startLoad:
          if (_isToMain(state.url) && !exiting) {
            if (widget.backForbid) {
              webViewReference.launch(widget.url);
            } else {
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        default:
          break;
      }
    });
    _onHttpError = webViewReference.onHttpError.listen((WebViewHttpError error) {});
    super.initState();
  }
  _isToMain(String url) {
    print(url);
    bool contain = false;
    for(final value in CATCH_URLS) {
      if(url?.endsWith(value) ?? false){
        contain = true;
        break;
      }
    }
    return contain;
  }
  void dispose() {
    _onUrlChange.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    webViewReference.dispose();
    super.dispose();
  }
  _appBar (Color backgroundColor, Color backButtonColor) {
    if(widget.hideAppBar ?? false) {
//  print( widget.hideHead);
      return  widget.hideHead ?
      Container() :
      Container(
        color: backgroundColor,
        height: Theme.of(context).platform == TargetPlatform.iOS ? 34 : 29,
        width: double.infinity,
      );
    }
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.fromLTRB(0, 38, 0, 10),
      child: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(Icons.close, color: backButtonColor, size: 24),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.title ?? '',
                  style: TextStyle(fontSize: 18, color: backButtonColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    String statusBarColor = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if(statusBarColor == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: <Widget>[
              _appBar(Color(int.parse('0xff' + statusBarColor)), backButtonColor),
              Expanded(
                  child: WebviewScaffold(
                    url: widget.url,
                    withZoom: true,
                    withLocalStorage: true,
                    hidden: true,
                    initialChild: Container(
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
              ),
            ],
          )
      ),
    );
  }
}