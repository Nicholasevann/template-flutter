import 'package:boneconsulting/core/helper/auth_interceptor.dart';
import 'package:boneconsulting/data/index.dart';
import 'package:boneconsulting/data/repositories/remote/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:boneconsulting/core/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';

final sl = GetIt.instance;

Future<void> init({required AppConfig appConfig}) async {
  sl.registerSingleton<AppConfig>(appConfig);
  sl.registerSingleton<AppRouter>(AppRouter());
  sl.registerSingleton(await SharedPreferences.getInstance());
  sl.registerSingleton(SessionRepository());

  final dio = Dio(BaseOptions(baseUrl: appConfig.baseUrl));
  dio.interceptors.add(AuthInterceptor());
  if (appConfig.flavor != Flavor.PROD) {
    dio.interceptors.add(AwesomeDioInterceptor());
  }
  sl.registerSingleton(dio);
  sl.registerSingleton(AuthRepository());
}
