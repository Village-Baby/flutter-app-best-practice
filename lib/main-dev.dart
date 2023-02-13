import 'package:best_practice/main-common.dart';
import 'package:best_practice/models/app_config.dart';
import 'package:best_practice/repositories/app_config_repository.dart';

void main() {
  appConfig.flavor = Flavor.dev;
  mainCommon();
}
