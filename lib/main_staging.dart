import 'package:example/core/index.dart';
import 'package:example/presentation/main_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await di.init(
    appConfig: AppConfig(
      title: 'Example Staging',
      flavor: Flavor.STAGING,
      dio: Dio(BaseOptions(baseUrl: 'https://staging.example.com')),
    ),
  );
  runApp(TranslationProvider(child: const ProviderScope(child: MainApp())));
}
