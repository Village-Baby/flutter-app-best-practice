import 'package:best_practice/interfaces/data/remote/count_api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countApiService = Provider((ref) => _CountApiService());

class _CountApiService with CountApiService {
  @override
  Future<int> decrease(int count) async {
    await Future.delayed(const Duration(seconds: 1));
    return count - 1;
  }

  @override
  Future<int> increase(int count) async {
    await Future.delayed(const Duration(seconds: 1));
    return count + 1;
  }
}
