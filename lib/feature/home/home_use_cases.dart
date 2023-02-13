import 'package:best_practice/feature/home/home_ui_actions.dart';
import 'package:best_practice/repositories/count_history_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeUseCases = StateNotifierProvider<HomeUseCases, HomePageState>(
    (ref) => HomeUseCases(repository: ref.read(countHistoryRepository)));

class HomeUseCases extends StateNotifier<HomePageState> {
  final CountHistoryRepository repository;
  late HomeUiActions uiActions;

  HomeUseCases({required this.repository}) : super(HomePageState.none);

  init(HomeUiActions uiActions) {
    this.uiActions = uiActions;
  }

  increase() async {
    state = HomePageState.loading;
    await repository.increase();
    state = HomePageState.none;
  }

  decrease() async {
    state = HomePageState.loading;
    await repository.decrease();
    state = HomePageState.none;
  }

  complete() {
    uiActions.goSettings();
  }

  int? get count => repository.current;
}

enum HomePageState {
  none,
  loading,
}
