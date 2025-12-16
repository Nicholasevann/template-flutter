import 'package:boneconsulting/core/app_service.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = AppService.session.getToken();
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // if (err.response?.statusCode == 401) {
    //   if (AppService.appRouter.current.name != LoginRoute.page.name) {
    //     AppService.appRouter.pushAndPopUntil(
    //       const LoginRoute(),
    //       predicate: (_) => false,
    //     );
    //   }
    // }
    super.onError(err, handler);
  }
}
