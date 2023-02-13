import 'package:best_practice/feature/home/home_page.dart';
import 'package:best_practice/feature/splash/splash_page.dart';
import 'package:best_practice/interfaces/data/local/app_id_services.dart';
import 'package:best_practice/models/app_config.dart';
import 'package:best_practice/repositories/app_config_repository.dart';
import 'package:best_practice/routers/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BestPracticeApp extends StatefulHookConsumerWidget {
  final AppConfig appConfig;

  const BestPracticeApp({
    required this.appConfig,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _BestPracticeAppState();
  }
}

class _BestPracticeAppState extends ConsumerState<BestPracticeApp> {
  @override
  void initState() {
    ref.read(appConfigRepository).init(appConfig: widget.appConfig);
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashPage.routeName,
      onGenerateRoute: router,
    );
  }
}
