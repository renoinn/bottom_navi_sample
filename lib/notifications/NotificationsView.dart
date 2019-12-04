import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key key}) : super(key: key);

  static const routeName = "notifications/";

  @override
  Widget build(BuildContext context) {
    print("build $routeName");
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int position) {
            return ListTile(
              title: Text("title $position"),
            );
          },
        ),
      ),
    );
  }

}
