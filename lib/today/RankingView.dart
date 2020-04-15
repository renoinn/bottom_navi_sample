import 'package:flutter/material.dart';

import 'TodayView.dart';

class RankingView extends StatelessWidget {
  const RankingView({Key key}) : super(key: key);

  static const routeName = "today/ranking";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Hero(
            tag: RankingViewHeroTag,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("pop ranking view"),
              ),
            ),
          ),
          Center(
            child: Text(routeName),
          ),
        ],
      ),
    );
  }

}