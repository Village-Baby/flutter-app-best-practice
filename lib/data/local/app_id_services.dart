import 'package:best_practice/data/shared_preferences_service.dart';
import 'package:best_practice/interfaces/data/local/app_id_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

final appIdServices = Provider((ref) => _AppIdServices());

class _AppIdServices extends SharedPreferencesService with AppIdServices {
  static const _appIdKey = 'key_app_id';

  @override
  Future<String> get appId async {
    String? result = await getString(_appIdKey);

    if (result?.isEmpty ?? true) {
      result = const Uuid().v4();
      await setString(key: _appIdKey, value: result);
    }

    return result!;
  }
}
