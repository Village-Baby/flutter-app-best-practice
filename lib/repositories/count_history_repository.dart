import 'package:best_practice/data/remote/count_api_service.dart';
import 'package:best_practice/interfaces/data/remote/count_api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countHistoryRepository = Provider<CountHistoryRepository>((ref) =>
    CountHistoryRepository(countApiService: ref.read(countApiService)));

class CountHistoryRepository extends StateNotifier<List<int>> {
  final CountApiService countApiService;

  CountHistoryRepository({required this.countApiService}) : super([]);

  increase() async {
    if (state.isEmpty) {
      state.add(0);
    } else {
      int current = state[state.length - 1];
      state.add(await countApiService.increase(current++));
    }
  }

  decrease() async {
    if (state.isEmpty) {
      state.add(0);
    } else {
      int current = state[state.length - 1];
      state.add(await countApiService.decrease(current--));
    }
  }
}
