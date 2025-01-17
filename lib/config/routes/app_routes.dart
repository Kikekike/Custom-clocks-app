import 'package:flutter/cupertino.dart';

import '../../ui/pages/main_page.dart';
import '../../ui/pages/splash_page.dart';

class AppRoutes {
  static const String splashPage = '/SplashPage';

  static const String mainPage = '/MainPage';

  static Map<String, WidgetBuilder> routes = {
    splashPage: (context) => SplashPage(),

    mainPage: (context) => MainPage(),
  };

}