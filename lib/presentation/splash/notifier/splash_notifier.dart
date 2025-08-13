import 'package:boneconsulting/presentation/splash/notifier/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(const SplashState());

  increase() {
    state = state.copyWith(counter: state.counter + 1);
  }
}

final splashProvider = StateNotifierProvider<SplashNotifier, SplashState>(
    (ref) => SplashNotifier());
