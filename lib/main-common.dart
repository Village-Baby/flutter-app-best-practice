import 'package:best_practice/best_practices_app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void mainCommon() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(
    child: BestPracticeApp(),
  ));
}
