import 'package:bottom_navi_sample/home/HomeView.dart';
import 'package:flutter/material.dart';

class HomeNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const HomeNavigator({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: HomeView.routeName,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch(settings.name) {
              case HomeView.routeName:
                return const HomeView();
            }
            return const HomeView();
          },
        );
      },
    );
  }

}