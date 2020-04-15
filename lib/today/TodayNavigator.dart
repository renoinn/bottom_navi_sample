import 'package:bottom_navi_sample/today/RankingView.dart';
import 'package:bottom_navi_sample/today/RecentView.dart';
import 'package:bottom_navi_sample/today/TodayView.dart';
import 'package:flutter/material.dart';

import 'package:bottom_navi_sample/main.dart';

class TodayNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const TodayNavigator({Key key, this.navigatorKey}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: TodayView.routeName,
      observers: [heroController],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch(settings.name) {
              case TodayView.routeName:
                return const TodayView();
              case RankingView.routeName:
                return const RankingView();
              case RecentView.routeName:
                return const RecentView();
            }
            return const TodayView();
          },
        );
      },
    );
  }

}