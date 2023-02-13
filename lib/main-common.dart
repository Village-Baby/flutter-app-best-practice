import 'dart:async';

import 'package:best_practice/best_practices_app.dart';
import 'package:best_practice/models/app_config.dart';
import 'package:best_practice/repositories/locale_repository.dart';
import 'package:best_practice/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer' as dev;

void mainCommon({
  required AppConfig appConfig,
  List<Override> mockProviders = const [],
}) {
  runZonedGuarded(() async {
    /// TODO firebase init, push init, dynamic link init and etc...
    return runApp(ProviderScope(
      overrides: mockProviders,
      child: EasyLocalization(
        supportedLocales: LocaleRepository.supportedLocales,
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        fallbackLocale: LocaleRepository.korean,
        startLocale: LocaleRepository.korean,
        path: AppStrings.resourcePath,
        child: BestPracticeApp(appConfig: appConfig),
      ),
    ));
  }, (error, stack) {
    dev.log('error on init app : $error', stackTrace: stack);
  });
}
