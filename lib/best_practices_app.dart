import 'package:best_practice/feature/home/home_page.dart';
import 'package:best_practice/feature/splash/splash_page.dart';
import 'package:best_practice/routers/router.dart';
import 'package:flutter/material.dart';

class BestPracticeApp extends StatelessWidget {
  const BestPracticeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashPage.routeName,
      onGenerateRoute: router,
    );
  }
}
