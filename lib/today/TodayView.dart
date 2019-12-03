import 'package:bottom_navi_sample/today/RankingView.dart';
import 'package:bottom_navi_sample/today/RecentView.dart';
import 'package:flutter/material.dart';

class TodayView extends StatelessWidget {
  const TodayView({Key key}) : super(key: key);

  static const routeName = "today/";

  @override
  Widget build(BuildContext context) {
    print("build $routeName");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(routeName),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, RankingView.routeName),
              child: Text("ranking view"),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, RecentView.routeName),
              child: Text("recent view"),
            ),
          ],
        ),
      ),
    );
  }

}