import 'package:best_practice/data/local/app_id_services.dart';
import 'package:best_practice/interfaces/data/local/app_id_services.dart';
import 'package:best_practice/models/app_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appConfigRepository = Provider(
    (ref) => _AppConfigRepository(appIdServices: ref.read(appIdServices)));

class _AppConfigRepository {
  late final AppConfig _appConfig;
  late final String _appId;

  final AppIdServices appIdServices;

  _AppConfigRepository({required this.appIdServices});

  init({
    required AppConfig appConfig,
  }) async {
    _appConfig = appConfig;
    _appId = await appIdServices.appId;
  }

  Flavor get flavor => _appConfig.flavor;

  // uuid 를 메모리에 유지한다.
  String get appId => _appId;
}
