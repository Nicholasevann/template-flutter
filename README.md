# Example Flutter Project

This is a Flutter project template with multiple flavors (prod, dev), Riverpod state management, AutoRoute navigation, and custom theming.

## Features

- **Multiple Flavors:** `prod`, `dev`
- **State Management:** [Riverpod](https://riverpod.dev/)
- **Navigation:** [AutoRoute](https://pub.dev/packages/auto_route)
- **Custom Theme:** Black, grey, and white color palette
- **Localization:** [Slang](https://pub.dev/packages/slang)
- **Dependency Injection:** [GetIt](https://pub.dev/packages/get_it)
- **API Client:** [Dio](https://pub.dev/packages/dio)

## Getting Started

### 1. Install dependencies

```sh
flutter pub get
```

### 2. Generate code

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Run the app

**Development flavor:**

```sh
flutter run -t lib/main_dev.dart --flavor dev
```

**Production flavor:**

```sh
flutter run -t lib/main_prod.dart --flavor prod
```

### 4. Build APK or IPA

```sh
# Android APK (dev)
flutter build apk -t lib/main_dev.dart --flavor dev --release

# Android APK (prod)
flutter build apk -t lib/main_prod.dart --flavor prod --release

# iOS IPA (prod)
flutter build ipa -t lib/main_prod.dart --flavor prod --release
```

## Project Structure

```
lib/
  core/         # Core utilities, themes, router
  data/         # Data models and repositories
  presentation/ # UI and state notifiers
  main_dev.dart
  main_prod.dart
```

## Customization

- **Change app name or package:**  
  Edit `android/app/build.gradle`, `ios/Runner.xcodeproj`, and `pubspec.yaml`.
- **Change theme:**  
  Edit `lib/core/theme/app_color.dart` and `lib/core/theme/app_font.dart`.

## License

This project is licensed under the
