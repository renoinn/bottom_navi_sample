import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  static const routeName = "/home";

  @override
  State<StatefulWidget> createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> {
  int count;

  @override
  void initState() {
    super.initState();
    count = 0;
    print("initState home");
  }

  @override
  void didChangeDependencies() {
    int param = PageStorage.of(context).readState(context);
    if (param != null) {
      count = param;
    } else {
      count = 0;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("build home");
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
              PageStorage.of(context).writeState(context, count);
            },
            child: Text("count up"),
          ),
        ],
      ),
    );
  }

}