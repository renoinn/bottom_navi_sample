import 'package:bottom_navi_sample/more/MoreView.dart';
import 'package:flutter/material.dart';

class MoreNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MoreNavigator({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: MoreView.routeName,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch(settings.name) {
              case MoreView.routeName:
                return const MoreView();
            }
            return const MoreView();
          },
        );
      },
    );
  }

}