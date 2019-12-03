import 'package:flutter/material.dart';

class RankingView extends StatelessWidget {
  const RankingView({Key key}) : super(key: key);

  static const routeName = "today/ranking";

  @override
  Widget build(BuildContext context) {
    print("build $routeName");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(routeName),
      ),
    );
  }

}