import 'package:example/core/app_service.dart';
import 'package:example/core/enum/enum.dart';

class SessionRepository {
  /// Shared preferences key
  static const String keyAccessToken = 'access_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyRole = 'role';
  static const String keyLanguage = 'language';

  String getToken() {
    String token = '';
    if (AppService.preference.containsKey(keyAccessToken)) {
      token = AppService.preference.getString(keyAccessToken) ?? '';
    }
    return token;
  }

  Future<String> getRefreshToken() async {
    String refreshToken = '';
    if (AppService.preference.containsKey(keyRefreshToken)) {
      refreshToken = AppService.preference.getString(keyRefreshToken) ?? '';
    }
    return refreshToken;
  }

  Future<Roles> getRoles() async {
    Roles roles = Roles.user;
    if (AppService.preference.containsKey(keyRole)) {
      String role = AppService.preference.getString(keyRole) ?? '';
      if (role == 'shop') {
        roles = Roles.shopAdmin;
      }
    }
    return roles;
  }

  changeLanguage({required String? language}) async {
    if (language != null) {
      AppService.preference.setString(keyLanguage, language);
    }
  }

  Future<String> getLanguage() async {
    String language = 'en'; // english is the default
    if (AppService.preference.containsKey(keyLanguage)) {
      language = AppService.preference.getString(keyLanguage) ?? '';
    }
    return language;
  }

  Future<void> saveToken({
    required String token,
    required String refreshToken,
    required String? role,
    required String? language,
  }) async {
    await AppService.preference.setString(keyAccessToken, token);
    await AppService.preference.setString(keyRefreshToken, refreshToken);
    if (role != null) {
      await AppService.preference.setString(keyRole, role);
    }
    if (language != null) {
      await AppService.preference.setString(keyLanguage, language);
    }
  }

  Future<void> deleteToken() async {
    await AppService.preference.remove(keyAccessToken);
    await AppService.preference.remove(keyRefreshToken);
    await AppService.preference.remove(keyRole);
  }
}
