import 'package:best_practice/data/remote/count_api_service.dart';
import 'package:best_practice/interfaces/data/remote/count_api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countHistoryRepository = Provider<CountHistoryRepository>((ref) =>
    CountHistoryRepository(countApiService: ref.read(countApiService)));

class CountHistoryRepository {
  final CountApiService countApiService;

  CountHistoryRepository({required this.countApiService}) : super();

  List<int> countHistory = [];

  increase() async {
    if (countHistory.isEmpty) {
      countHistory.add(0);
    } else {
      int current = countHistory[countHistory.length - 1];
      countHistory.add(await countApiService.increase(current++));
    }
  }

  decrease() async {
    if (countHistory.isEmpty) {
      countHistory.add(0);
    } else {
      int current = countHistory[countHistory.length - 1];
      countHistory.add(await countApiService.decrease(current--));
    }
  }

  int? get current =>
      countHistory.isEmpty ? null : countHistory[countHistory.length - 1];
}
