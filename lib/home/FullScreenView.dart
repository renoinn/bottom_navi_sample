import 'package:bottom_navi_sample/home/HomeView.dart';
import 'package:flutter/material.dart';

class FullScreenView extends StatelessWidget {
  const FullScreenView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Hero(
            tag: FullScreenViewHeroTag,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text('pop full screen'),
            ),
          ),
          Center(child: Text('FullScreenView'),),
        ],
      ),
    );
  }
}
