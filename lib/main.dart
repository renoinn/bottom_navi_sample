import 'package:bottom_navi_sample/home/HomeNavigator.dart';
import 'package:bottom_navi_sample/more/MoreNavigator.dart';
import 'package:bottom_navi_sample/more/MoreView.dart';
import 'package:bottom_navi_sample/notifications/NotificationsNavigator.dart';
import 'package:bottom_navi_sample/notifications/NotificationsView.dart';
import 'package:bottom_navi_sample/today/TodayNavigator.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navi_sample/home/HomeView.dart';

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

typedef RootViewCallback = Widget Function();

class _NavigationRootModel {
  final int index;
  final IconData icon;
  final String title;
  final RootViewCallback createView;

  _NavigationRootModel(this.index, this.icon, this.title, this.createView);

}

class _MyHomePageState extends State<MyHomePage> {
  final _homeKey = GlobalKey<NavigatorState>();
  final _notificationsKey = GlobalKey<NavigatorState>();
  final _todayKey = GlobalKey<NavigatorState>();
  final _moreKey = GlobalKey<NavigatorState>();

  Map<int, Widget> views = {};
  int currentIndex;
  List<_NavigationRootModel> models = [];
  List<GlobalKey> modelGlobalKeys = [];

  @override
  void initState() {
    super.initState();
    final homeModel = _NavigationRootModel(0, Icons.home, "ホーム", () => HomeNavigator(navigatorKey: _homeKey,));
    final notificationsModel = _NavigationRootModel(1, Icons.notifications, "通知", () => NotificationNavigator(navigatorKey: _notificationsKey,));
    final todayModel = _NavigationRootModel(2, Icons.today, "ニュース", () => TodayNavigator(navigatorKey: _todayKey,));
    final moreModel = _NavigationRootModel(3, Icons.more_horiz, "その他", () => MoreNavigator(navigatorKey: _moreKey,));
    models = [
      homeModel,
      notificationsModel,
      todayModel,
      moreModel,
    ];
    modelGlobalKeys = [
      _homeKey,
      _notificationsKey,
      _todayKey,
      _moreKey,
    ];
    currentIndex = 0;
    views[currentIndex] = models[currentIndex].createView();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = models.map((model) {
      return Offstage(
        offstage: currentIndex != model.index,
        child: views[model.index],
      );
    }).toList();

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: children,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.purple,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: models.map((model) {
                return _NavigationButton(
                  icon: model.icon,
                  title: model.title,
                  onPressed: () => onPressNavigationButton(model),
                  selected: currentIndex == model.index,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  void onPressNavigationButton(_NavigationRootModel model) {
    setState(() {
      if (!views.containsKey(model.index)) {
        views.putIfAbsent(model.index, () => model.createView());
      }
      if (currentIndex == model.index) {
        final GlobalKey<NavigatorState> key = modelGlobalKeys[currentIndex];
        key.currentState.popUntil((route) => route.isFirst);
      }
      currentIndex = model.index;
    });
  }

  Future<bool> _onWillPop() async {
    final GlobalKey<NavigatorState> key = modelGlobalKeys[currentIndex];
    final isFirstRouteInCurrentTab = !await key.currentState.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (currentIndex != 0) {
        setState(() {
          currentIndex = 0;
        });
        return false;
      }
    }

    return isFirstRouteInCurrentTab;
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
