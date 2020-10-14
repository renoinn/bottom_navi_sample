import 'package:bottom_navi_sample/today/RankingView.dart';
import 'package:bottom_navi_sample/today/RecentView.dart';
import 'package:flutter/material.dart';

const RankingViewHeroTag = 'RankingViewHeroTag';

class TodayView extends StatelessWidget {
  const TodayView({Key key}) : super(key: key);

  static const routeName = "today/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(routeName),
            Hero(
              tag: RankingViewHeroTag,
              child: Center(
                child: RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, RankingView.routeName),
                  child: Text("ranking view"),
                ),
              ),
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
