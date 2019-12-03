import 'package:bottom_navi_sample/more/MoreView.dart';
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

  final homeModel = _NavigationRootModel(0, Icons.home, "ホーム", () => const HomeView());
  final notificationsModel = _NavigationRootModel(1, Icons.notifications, "通知", () => const NotificationsView());
  final todayModel = _NavigationRootModel(2, Icons.today, "ニュース", () => const TodayNavigator());
  final moreModel = _NavigationRootModel(3, Icons.more_horiz, "その他", () => const MoreView());

  Map<int, Widget> views = {};
  int currentIndex;
  List<_NavigationRootModel> models = [];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    models = [
      homeModel,
      notificationsModel,
      todayModel,
      moreModel,
    ];
    views[currentIndex] = models[currentIndex].createView();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: models.map((model) {
          return Offstage(
            offstage: currentIndex != model.index,
            child: views[model.index],
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
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
                    icon: homeModel.icon,
                    title: homeModel.title,
                    onPressed: () => onPressNavigationButton(homeModel),
                    selected: currentIndex == homeModel.index,
                  ),
                  _NavigationButton(
                    icon: notificationsModel.icon,
                    title: notificationsModel.title,
                    onPressed: () => onPressNavigationButton(notificationsModel),
                    selected: currentIndex == notificationsModel.index,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  _NavigationButton(
                    icon: todayModel.icon,
                    title: todayModel.title,
                    onPressed: () => onPressNavigationButton(todayModel),
                    selected: currentIndex == todayModel.index,
                  ),
                  _NavigationButton(
                    icon: moreModel.icon,
                    title: moreModel.title,
                    onPressed: () => onPressNavigationButton(moreModel),
                    selected: currentIndex == moreModel.index,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressNavigationButton(_NavigationRootModel model) {
    setState(() {
      if (!views.containsKey(model.index)) {
        print("putIfAbsent");
        views.putIfAbsent(model.index, () => model.createView());
      }
      currentIndex = model.index;
    });
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





