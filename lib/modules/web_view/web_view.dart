import '../../shared/constant/app_imports.dart';

class WebViewScreen extends StatelessWidget {

  InAppWebViewController?  webViewController;
  String? url;
  WebViewScreen({required this.url});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri("${url}"),),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
        ),
      ),
    );
  }
}
