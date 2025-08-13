import 'package:boneconsulting/core/app_config.dart';
import 'package:boneconsulting/core/routes/app_router.dart';
import 'package:get_it/get_it.dart';

class Service {
  static AppConfig get appConfig => GetIt.instance<AppConfig>();
  static AppRouter get appRouter => GetIt.instance<AppRouter>();
}
