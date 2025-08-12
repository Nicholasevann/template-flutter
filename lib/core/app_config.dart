// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';

enum Flavor { DEV, STAGING, PROD }

class AppConfig {
  final String title;
  final Flavor flavor;
  final Dio dio;

  AppConfig({required this.title, required this.flavor, required this.dio});
}
