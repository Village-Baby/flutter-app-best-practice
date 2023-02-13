import 'package:best_practice/feature/home/home_use_cases.dart';

mixin HomeUiActions {
  goSettings();

  HomeUseCases get read;

  HomePageState get watch;
}
