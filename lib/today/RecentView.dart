import 'package:flutter/material.dart';

class RecentView extends StatelessWidget {
  const RecentView({Key key}) : super(key: key);

  static const routeName = "today/recent";

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