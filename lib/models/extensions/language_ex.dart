import 'package:best_practice/models/language.dart';

extension LanguageEx on Language {
  String get string {
    String ret;
    switch (this) {
      case Language.korean:
        ret = 'korean';
        break;
      case Language.english:
        ret = 'english';
        break;
      case Language.auto:
        ret = 'auto';
        break;
    }
    return ret;
  }

  static Language fromString(String value) {
    Language ret;

    switch (value) {
      case 'korean':
        ret = Language.korean;
        break;
      case 'english':
        ret = Language.english;
        break;
      default:
        ret = Language.auto;
        break;
    }

    return ret;
  }
}
