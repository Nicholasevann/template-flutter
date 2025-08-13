import 'package:boneconsulting/core/app_service.dart';
import 'package:boneconsulting/data/models/auth/user_model.dart';
import 'package:boneconsulting/shared/index.dart';
import 'package:boneconsulting/shared/models/single_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final dio = AppService.dio;

  Future<Either<Failure, SingleResponse<UserModel>>> register({
    required String fullname,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await dio.post('auth/register', data: {
        "full_name": fullname,
        "email": email,
        "password": password,
        "phone": phone,
        "role": "user",
      });
      print(response.data);
      return Right(
        SingleResponse<UserModel>.fromJson(
          response.data,
          (json) => UserModel.fromJson(json),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure(message: e.toString(), error: e));
    }
  }

  Future<Either<Failure, SingleResponse<UserModel>>> login({
    String? email,
    String? password,
    String? access_token_social,
    String? provider,
  }) async {
    try {
      final Map<String, dynamic> payload = {};

      if (access_token_social != null && provider != null) {
        // Login with social provider
        payload['access_token_social'] = access_token_social;
        payload['provider'] = provider;
      } else {
        // Normal login with email/password
        payload['uid'] = email;
        payload['password'] = password;
      }

      final response = await dio.post('/login', data: payload);
      return Right(
        SingleResponse<UserModel>.fromJson(
          response.data,
          (json) => UserModel.fromJson(json),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure(message: e.toString(), error: e));
    }
  }
}
