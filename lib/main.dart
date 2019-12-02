import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> pages = [
    const _HomeView(key: PageStorageKey<String>(_HomeView.routeName)),
    const _NotificationsView(key: PageStorageKey<String>(_NotificationsView.routeName)),
    const _TimelineView(key: PageStorageKey<String>(_TimelineView.routeName)),
    const _MoreView(key: PageStorageKey<String>(_TimelineView.routeName)),
  ];
  int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body: PageStorage(
        child: pages[currentIndex],
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  _NavigationButton(
                    icon: Icons.home,
                    title: "ホーム",
                    onPressed: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    selected: currentIndex == 0,
                  ),
                  _NavigationButton(
                    icon: Icons.notifications,
                    title: "通知",
                    onPressed: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    selected: currentIndex == 1,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  _NavigationButton(
                    icon: Icons.today,
                    title: "ニュース",
                    onPressed: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                    selected: currentIndex == 2,
                  ),
                  _NavigationButton(
                    icon: Icons.more_horiz,
                    title: "その他",
                    onPressed: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                    selected: currentIndex == 3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  final bool selected;

  const _NavigationButton({Key key, this.icon, this.title, this.onPressed, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: selected ? Colors.blue : Colors.white,
          ),
          Text(
            title,
            style: TextStyle(
              color: selected ? Colors.blue : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

}


class _HomeView extends StatefulWidget {
  const _HomeView({Key key}) : super(key: key);

  static const routeName = "/home";

  @override
  State<StatefulWidget> createState() => _HomeViewState();

}

class _HomeViewState extends State<_HomeView> {
  int count;

  @override
  void initState() {
    super.initState();
    count = 0;
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
    return Scaffold(
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

class _NotificationsView extends StatelessWidget {
  const _NotificationsView({Key key}) : super(key: key);

  static const routeName = "/notifications";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(routeName),
      ),
    );
  }

}

class _TimelineView extends StatelessWidget {
  const _TimelineView({Key key}) : super(key: key);

  static const routeName = "/timeline";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(routeName),
      ),
    );
  }

}

class _MoreView extends StatelessWidget {
  const _MoreView({Key key}) : super(key: key);

  static const routeName = "/more";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(routeName),
      ),
    );
  }

}