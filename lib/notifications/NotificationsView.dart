import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key key}) : super(key: key);

  static const routeName = "notifications/";

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
