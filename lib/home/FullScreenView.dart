import 'package:flutter/material.dart';

class FullScreenView extends StatelessWidget {
  const FullScreenView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("FullScreenView"),),
    );
  }
}
