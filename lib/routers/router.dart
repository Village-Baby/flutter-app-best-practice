import 'package:best_practice/feature/error/error_page.dart';
import 'package:best_practice/feature/home/home_page.dart';
import 'package:best_practice/feature/splash/splash_page.dart';
import 'package:best_practice/typedefs/typedefs.dart';
import 'package:flutter/material.dart';

AppRouter router = (RouteSettings settings) {
  Widget ret;
  switch (settings.name) {
    case SplashPage.routeName:
      ret = _routeSplash(settings);
      break;
    case HomePage.routeName:
      ret = _routeHome(settings);
      break;
    case ErrorPage.routeName:
    default:
      ret = const ErrorPage();
  }

  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, animation1, animation2) {
      return ret;
    },
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
};

Widget _routeHome(RouteSettings settings) {
  /// TODO
  return const HomePage();
}

Widget _routeSplash(RouteSettings settings) {
  return const SplashPage();
}
