import 'dart:ui';
import 'package:best_practice/models/language.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localeRepository = Provider((ref) => LocaleRepository());

class LocaleRepository {
  static const Locale english = Locale('en');
  static const Locale korean = Locale('ko');
  static List<Locale> supportedLocales = [english, korean];

  changeLocale(Language language) {
    /// TODO - implement
  }
}
