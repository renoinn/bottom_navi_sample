import 'package:bottom_navi_sample/home/FullScreenView.dart';
import 'package:flutter/material.dart';

const FullScreenViewHeroTag = 'FullScreenViewHeroTag';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  static const routeName = 'home/';

  @override
  State<StatefulWidget> createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> {
  int count;

  @override
  void initState() {
    super.initState();
    count = 0;
    print('initState home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text(count.toString()),
          RaisedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Text('count up'),
          ),
          Hero(
            tag: FullScreenViewHeroTag,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (_) => const FullScreenView(),
                  fullscreenDialog: true,
                ));
              },
              child: Text('push full screen'),
            ),
          ),
        ],
      ),
    );
  }

}