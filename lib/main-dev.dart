import 'package:best_practice/main-common.dart';
import 'package:best_practice/models/app_config.dart';
import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  mainCommon(appConfig: AppConfig(flavor: Flavor.dev));
}
