import 'package:example/core/app_config.dart';
import 'package:example/core/routes/app_router.dart';
import 'package:get_it/get_it.dart';

class Service {
  static AppConfig get appConfig => GetIt.instance<AppConfig>();
  static AppRouter get appRouter => GetIt.instance<AppRouter>();
}
