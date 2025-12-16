import 'package:boneconsulting/core/index.dart';
import 'package:boneconsulting/presentation/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await di.init(
    appConfig: AppConfig(
        title: 'Xperience Staging',
        flavor: Flavor.STAGING,
        baseUrl: 'https://staging-api.boneconsulting.com/api/v1'),
  );
  runApp(TranslationProvider(child: const ProviderScope(child: MainApp())));
}
