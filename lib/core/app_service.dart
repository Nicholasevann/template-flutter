import 'package:example/core/app_config.dart';
import 'package:example/core/routes/app_router.dart';
import 'package:example/data/index.dart';
import 'package:example/data/repositories/remote/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService {
  static AppConfig get appConfig => GetIt.instance<AppConfig>();
  static AppRouter get appRouter => GetIt.instance<AppRouter>();
  static Dio get dio => GetIt.instance<Dio>();
  static SharedPreferences get preference =>
      GetIt.instance.get<SharedPreferences>();
  static SessionRepository get session =>
      GetIt.instance.get<SessionRepository>();
  static AuthRepository get auth => GetIt.instance.get<AuthRepository>();
}
