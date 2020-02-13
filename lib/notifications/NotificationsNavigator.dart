import 'package:bottom_navi_sample/notifications/NotificationsView.dart';
import 'package:flutter/material.dart';

class NotificationNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const NotificationNavigator({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: NotificationsView.routeName,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch(settings.name) {
              case NotificationsView.routeName:
                return const NotificationsView();
            }
            return const NotificationsView();
          },
        );
      },
    );
  }

}