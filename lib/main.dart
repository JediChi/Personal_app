import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyPersonalApp());

enum ScreenType { Desktop, Tablet, Handset, Watch }

class FormFactor {
  static const double desktop = 900.0;
  static const double tablet = 600.0;
  static const double handset = 300.0;
}

ScreenType getFormFactor(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > FormFactor.desktop) return ScreenType.Desktop;
  if (deviceWidth > FormFactor.tablet) return ScreenType.Tablet;
  if (deviceWidth > FormFactor.handset) return ScreenType.Handset;
  return ScreenType.Watch;
}

class MyPersonalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final String slackName = "Adanma Akanno";
  final String githubUrl = "https://github.com/JediChi";

  @override
  Widget build(BuildContext context) {
    final screenType = getFormFactor(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.alphaBlend(Colors.brown, Colors.green),
        title: Text("My Slack and Github Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              slackName,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://avatars.slack-edge.com/2023-09-07/5855613426374_9e90a90803f43300de10_1024.jpg",
              ),
              radius:  screenType == ScreenType.Desktop ? 100 : 50,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GithubView(githubUrl),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.alphaBlend(Colors.brown, Colors.green),
              ),
              child: Text(
                "Open Github",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GithubView extends StatelessWidget {
  final String url;

  GithubView(this.url);

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..scrollBy(1, 3)
    ..loadRequest(
      Uri.parse("https://github.com/JediChi"),
    );

  @override
  Widget build(BuildContext context) {
    final screenType = getFormFactor(context);
    // final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    //   Factory(() => EagerGestureRecognizer())
    // };
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Profile"),
      ),
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: screenType == ScreenType.Desktop ? 16 / 9 : 9 / 16,
          child: WebViewWidget(
            controller: controller,
            gestureRecognizers: Set()
              ..add(
                Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer(),
                )
              )
              ..add(
                Factory<HorizontalDragGestureRecognizer>(
                  () => HorizontalDragGestureRecognizer(),
                ),
              ),
          ),
        ),
      ),
    );
  }
}
