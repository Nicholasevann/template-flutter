enum Flavor { DEV, STAGING, PROD }

class AppConfig {
  final String title;
  final Flavor flavor;
  final String baseUrl;

  AppConfig({required this.title, required this.flavor, required this.baseUrl});
}
