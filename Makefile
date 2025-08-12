build_runner:
	flutter packages pub run build_runner build

slang:
	dart run slang


# Deployment on Android

# Flutter Deployment
build_aab_dev:
	flutter build appbundle -t lib/main_dev.dart --flavor dev --release
build_aab_staging:
	flutter build appbundle -t lib/main_staging.dart --flavor staging --release
build_aab_prod:
	flutter build appbundle -t lib/main_prod.dart --flavor prod --release

# Flutter Deployment
build_apk_dev:
	flutter build apk -t lib/main_dev.dart --flavor dev --release
build_apk_staging:
	flutter build apk -t lib/main_staging.dart --flavor staging --release
build_apk_prod:
	flutter build apk -t lib/main_prod.dart --flavor prod --release

# Shorebird Deployment
build_shorebird_android_dev:
	shorebird release android -t lib/main_dev.dart --flavor dev --artifact apk
build_shorebird_android_staging:
	shorebird release android -t lib/main_staging.dart --flavor staging --artifact apk
build_shorebird_android_prod:
	shorebird release android -t lib/main_prod.dart --flavor prod --artifact apk


# Deployment on iOS

# Flutter Deployment
build_ipa_dev:
	flutter build ipa -t lib/main_dev.dart --flavor dev --release
build_ipa_staging:
	flutter build ipa -t lib/main_staging.dart --flavor staging --release
build_ipa_prod:
	flutter build ipa -t lib/main_prod.dart --flavor prod --release

# Shorebird Deployment
build_shorebird_ios_dev:
	shorebird release ios -t lib/main_dev.dart --flavor dev
build_shorebird_ios_staging:
	shorebird release ios -t lib/main_staging.dart --flavor staging
build_shorebird_ios_prod:
	shorebird release ios -t lib/main_prod.dart --flavor prod
