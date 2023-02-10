import 'package:best_practice/feature/home/home_ui_actions.dart';
import 'package:best_practice/repositories/count_history_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeUseCases = StateNotifierProvider<HomeUseCases, HomePageState>((ref) =>
    HomeUseCases(countHistoryRepository: ref.read(countHistoryRepository)));

class HomeUseCases extends StateNotifier<HomePageState> {
  final CountHistoryRepository countHistoryRepository;
  late HomeUiActions uiActions;
  int count = 0;

  HomeUseCases({required this.countHistoryRepository})
      : super(HomePageState.none);

  init(HomeUiActions uiActions) {
    this.uiActions = uiActions;
  }

  increase() async {
    await Future.delayed(const Duration(seconds: 1));
    count++;
  }

  decrease() async {
    await Future.delayed(const Duration(seconds: 1));
    count--;
  }

  complete() {
    uiActions.goSettings();
  }
}

enum HomePageState {
  none,
  loading,
}
