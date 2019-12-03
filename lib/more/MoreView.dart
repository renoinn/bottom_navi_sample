import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key key}) : super(key: key);

  static const routeName = "more/";

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