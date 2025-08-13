import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:boneconsulting/core/index.dart';

final sl = GetIt.instance;

Future<void> init({required AppConfig appConfig}) async {
  sl.registerSingleton<AppConfig>(appConfig);
  sl.registerSingleton<AppRouter>(AppRouter());
  sl.registerLazySingleton<Dio>(() => Dio());
}
