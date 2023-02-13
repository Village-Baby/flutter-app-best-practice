import 'package:best_practice/feature/home/home_ui_actions.dart';
import 'package:best_practice/repositories/count_history_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeUseCases = StateNotifierProvider<HomeUseCases, HomePageState>((ref) =>
    HomeUseCases(countHistoryRepository: ref.read(countHistoryRepository)));

class HomeUseCases extends StateNotifier<HomePageState> {
  final CountHistoryRepository countHistoryRepository;
  late HomeUiActions uiActions;

  HomeUseCases({required this.countHistoryRepository})
      : super(HomePageState.none);

  init(HomeUiActions uiActions) {
    this.uiActions = uiActions;
  }

  increase() async {
    state = HomePageState.loading;
    await countHistoryRepository.increase();
    state = HomePageState.none;
  }

  decrease() async {
    state = HomePageState.loading;
    await countHistoryRepository.decrease();
    state = HomePageState.none;
  }

  complete() {
    uiActions.goSettings();
  }
}

enum HomePageState {
  none,
  loading,
}
