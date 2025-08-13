import 'package:auto_route/auto_route.dart';
import 'package:boneconsulting/core/app_service.dart';
import 'package:boneconsulting/core/routes/app_router.gr.dart';
import 'package:boneconsulting/core/utils/toast_utils.dart';
import 'package:boneconsulting/data/repositories/remote/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_state.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(authRepository: AuthRepository()),
);

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier({required this.authRepository}) : super(const LoginState());
  final AuthRepository authRepository;
  login(
    BuildContext context, {
    String? email,
    String? password,
  }) async {
    state = state.copyWith(isLoading: true);
    final res = await authRepository.login(
      email: email,
      password: password,
    );
    state = state.copyWith(isLoading: false);
    res.fold((failure) {
      ToastUtil.showErrorToast(context, msg: failure.message);
    }, (result) {
      AppService.session.saveToken(
        token: result.token?.accessToken ?? '',
        refreshToken: result.token?.refreshToken ?? '',
        role: result.data?.role,
        language: result.data?.language,
      );
      AutoRouter.of(context).pushAndPopUntil(
        const MainRoute(),
        predicate: (_) => false,
      );
    });
  }
}
