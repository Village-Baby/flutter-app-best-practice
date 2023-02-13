import 'dart:async';

import 'package:best_practice/best_practices_app.dart';
import 'package:best_practice/models/app_config.dart';
import 'package:best_practice/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer' as dev;

void mainCommon({
  required AppConfig appConfig,
}) {
  runZonedGuarded(() async {
    return runApp(ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ko'),
        ],
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        fallbackLocale: const Locale('ko'),
        startLocale: const Locale('ko'),
        path: AppStrings.resourcePath,
        child: BestPracticeApp(appConfig: appConfig),
      ),
    ));
  }, (error, stack) {
    dev.log('error on init app : $error', stackTrace: stack);
  });
}
