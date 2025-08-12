/// Generated file. Do not edit.
///
/// Original: lib/core/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 3
/// Strings: 60 (20 per locale)
///
/// Built on 2025-08-12 at 06:38 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  en(languageCode: 'en', build: Translations.build),
  id(languageCode: 'id', build: _StringsId.build),
  ru(languageCode: 'ru', build: _StringsRu.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, Translations> build;

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  // Translations
  late final _StringsLoginEn login = _StringsLoginEn._(_root);
  late final _StringsRegisterEn register = _StringsRegisterEn._(_root);
  late final _StringsTextfieldEn textfield = _StringsTextfieldEn._(_root);
  late final _StringsButtonEn button = _StringsButtonEn._(_root);
}

// Path: login
class _StringsLoginEn {
  _StringsLoginEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Welcome to Example';
  String get subtitle => 'Get your discount right away';
  String get no_account => 'Don\'t have an account?';
}

// Path: register
class _StringsRegisterEn {
  _StringsRegisterEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Create Your Account';
  String get subtitle => 'Get your discount right away';
  String get have_account => 'Already have an account?';
}

// Path: textfield
class _StringsTextfieldEn {
  _StringsTextfieldEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsTextfieldFullnameEn fullname =
      _StringsTextfieldFullnameEn._(_root);
  late final _StringsTextfieldEmailEn email = _StringsTextfieldEmailEn._(_root);
  late final _StringsTextfieldPasswordEn password =
      _StringsTextfieldPasswordEn._(_root);
  late final _StringsTextfieldPasswordConfirmEn password_confirm =
      _StringsTextfieldPasswordConfirmEn._(_root);
}

// Path: button
class _StringsButtonEn {
  _StringsButtonEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get login => 'Log In';
  String get register => 'Register';
}

// Path: textfield.fullname
class _StringsTextfieldFullnameEn {
  _StringsTextfieldFullnameEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'Fullname';
  String get hint => 'Input your full name';
  String get error => 'Full name must not empty';
}

// Path: textfield.email
class _StringsTextfieldEmailEn {
  _StringsTextfieldEmailEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'Email';
  String get hint => 'Input your email';
  String get error => 'Email is not valid';
}

// Path: textfield.password
class _StringsTextfieldPasswordEn {
  _StringsTextfieldPasswordEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'Password';
  String get hint => 'Input your password';
  String get error => 'Password is not valid';
}

// Path: textfield.password_confirm
class _StringsTextfieldPasswordConfirmEn {
  _StringsTextfieldPasswordConfirmEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'Confirm Password';
  String get hint => 'Input your confirmation password';
  String get error => 'Confirmation password is not valid';
}

// Path: <root>
class _StringsId implements Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsId.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.id,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <id>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _StringsId _root = this; // ignore: unused_field

  // Translations
  @override
  late final _StringsLoginId login = _StringsLoginId._(_root);
  @override
  late final _StringsRegisterId register = _StringsRegisterId._(_root);
  @override
  late final _StringsTextfieldId textfield = _StringsTextfieldId._(_root);
  @override
  late final _StringsButtonId button = _StringsButtonId._(_root);
}

// Path: login
class _StringsLoginId implements _StringsLoginEn {
  _StringsLoginId._(this._root);

  @override
  final _StringsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Welcome to Bali Discount';
  @override
  String get subtitle => 'Get your discount right away';
  @override
  String get no_account => 'Don\'t have an account?';
}

// Path: register
class _StringsRegisterId implements _StringsRegisterEn {
  _StringsRegisterId._(this._root);

  @override
  final _StringsId _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Create Your Account';
  @override
  String get subtitle => 'Get your discount right away';
  @override
  String get have_account => 'Already have an account?';
}

// Path: textfield
class _StringsTextfieldId implements _StringsTextfieldEn {
  _StringsTextfieldId._(this._root);

  @override
  final _StringsId _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsTextfieldFullnameId fullname =
      _StringsTextfieldFullnameId._(_root);
  @override
  late final _StringsTextfieldEmailId email = _StringsTextfieldEmailId._(_root);
  @override
  late final _StringsTextfieldPasswordId password =
      _StringsTextfieldPasswordId._(_root);
  @override
  late final _StringsTextfieldPasswordConfirmId password_confirm =
      _StringsTextfieldPasswordConfirmId._(_root);
}

// Path: button
class _StringsButtonId implements _StringsButtonEn {
  _StringsButtonId._(this._root);

  @override
  final _StringsId _root; // ignore: unused_field

  // Translations
  @override
  String get login => 'Log In';
  @override
  String get register => 'Register';
}

// Path: textfield.fullname
class _StringsTextfieldFullnameId implements _StringsTextfieldFullnameEn {
  _StringsTextfieldFullnameId._(this._root);

  @override
  final _StringsId _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Fullname';
  @override
  String get hint => 'Input your full name';
  @override
  String get error => 'Full name must not empty';
}

// Path: textfield.email
class _StringsTextfieldEmailId implements _StringsTextfieldEmailEn {
  _StringsTextfieldEmailId._(this._root);

  @override
  final _StringsId _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Email';
  @override
  String get hint => 'Input your email';
  @override
  String get error => 'Email is not valid';
}

// Path: textfield.password
class _StringsTextfieldPasswordId implements _StringsTextfieldPasswordEn {
  _StringsTextfieldPasswordId._(this._root);

  @override
  final _StringsId _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Password';
  @override
  String get hint => 'Input your password';
  @override
  String get error => 'Password is not valid';
}

// Path: textfield.password_confirm
class _StringsTextfieldPasswordConfirmId
    implements _StringsTextfieldPasswordConfirmEn {
  _StringsTextfieldPasswordConfirmId._(this._root);

  @override
  final _StringsId _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Confirm Password';
  @override
  String get hint => 'Input your confirmation password';
  @override
  String get error => 'Confirmation password is not valid';
}

// Path: <root>
class _StringsRu implements Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsRu.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.ru,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ru>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _StringsRu _root = this; // ignore: unused_field

  // Translations
  @override
  late final _StringsLoginRu login = _StringsLoginRu._(_root);
  @override
  late final _StringsRegisterRu register = _StringsRegisterRu._(_root);
  @override
  late final _StringsTextfieldRu textfield = _StringsTextfieldRu._(_root);
  @override
  late final _StringsButtonRu button = _StringsButtonRu._(_root);
}

// Path: login
class _StringsLoginRu implements _StringsLoginEn {
  _StringsLoginRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Welcome to Bali Discount';
  @override
  String get subtitle => 'Get your discount right away';
  @override
  String get no_account => 'Don\'t have an account?';
}

// Path: register
class _StringsRegisterRu implements _StringsRegisterEn {
  _StringsRegisterRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Create Your Account';
  @override
  String get subtitle => 'Get your discount right away';
  @override
  String get have_account => 'Already have an account?';
}

// Path: textfield
class _StringsTextfieldRu implements _StringsTextfieldEn {
  _StringsTextfieldRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsTextfieldFullnameRu fullname =
      _StringsTextfieldFullnameRu._(_root);
  @override
  late final _StringsTextfieldEmailRu email = _StringsTextfieldEmailRu._(_root);
  @override
  late final _StringsTextfieldPasswordRu password =
      _StringsTextfieldPasswordRu._(_root);
  @override
  late final _StringsTextfieldPasswordConfirmRu password_confirm =
      _StringsTextfieldPasswordConfirmRu._(_root);
}

// Path: button
class _StringsButtonRu implements _StringsButtonEn {
  _StringsButtonRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get login => 'Log In';
  @override
  String get register => 'Register';
}

// Path: textfield.fullname
class _StringsTextfieldFullnameRu implements _StringsTextfieldFullnameEn {
  _StringsTextfieldFullnameRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Fullname';
  @override
  String get hint => 'Input your full name';
  @override
  String get error => 'Full name must not empty';
}

// Path: textfield.email
class _StringsTextfieldEmailRu implements _StringsTextfieldEmailEn {
  _StringsTextfieldEmailRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Email';
  @override
  String get hint => 'Input your email';
  @override
  String get error => 'Email is not valid';
}

// Path: textfield.password
class _StringsTextfieldPasswordRu implements _StringsTextfieldPasswordEn {
  _StringsTextfieldPasswordRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Password';
  @override
  String get hint => 'Input your password';
  @override
  String get error => 'Password is not valid';
}

// Path: textfield.password_confirm
class _StringsTextfieldPasswordConfirmRu
    implements _StringsTextfieldPasswordConfirmEn {
  _StringsTextfieldPasswordConfirmRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Confirm Password';
  @override
  String get hint => 'Input your confirmation password';
  @override
  String get error => 'Confirmation password is not valid';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'login.title':
        return 'Welcome to Bali Discount';
      case 'login.subtitle':
        return 'Get your discount right away';
      case 'login.no_account':
        return 'Don\'t have an account?';
      case 'register.title':
        return 'Create Your Account';
      case 'register.subtitle':
        return 'Get your discount right away';
      case 'register.have_account':
        return 'Already have an account?';
      case 'textfield.fullname.label':
        return 'Fullname';
      case 'textfield.fullname.hint':
        return 'Input your full name';
      case 'textfield.fullname.error':
        return 'Full name must not empty';
      case 'textfield.email.label':
        return 'Email';
      case 'textfield.email.hint':
        return 'Input your email';
      case 'textfield.email.error':
        return 'Email is not valid';
      case 'textfield.password.label':
        return 'Password';
      case 'textfield.password.hint':
        return 'Input your password';
      case 'textfield.password.error':
        return 'Password is not valid';
      case 'textfield.password_confirm.label':
        return 'Confirm Password';
      case 'textfield.password_confirm.hint':
        return 'Input your confirmation password';
      case 'textfield.password_confirm.error':
        return 'Confirmation password is not valid';
      case 'button.login':
        return 'Log In';
      case 'button.register':
        return 'Register';
      default:
        return null;
    }
  }
}

extension on _StringsId {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'login.title':
        return 'Welcome to Bali Discount';
      case 'login.subtitle':
        return 'Get your discount right away';
      case 'login.no_account':
        return 'Don\'t have an account?';
      case 'register.title':
        return 'Create Your Account';
      case 'register.subtitle':
        return 'Get your discount right away';
      case 'register.have_account':
        return 'Already have an account?';
      case 'textfield.fullname.label':
        return 'Fullname';
      case 'textfield.fullname.hint':
        return 'Input your full name';
      case 'textfield.fullname.error':
        return 'Full name must not empty';
      case 'textfield.email.label':
        return 'Email';
      case 'textfield.email.hint':
        return 'Input your email';
      case 'textfield.email.error':
        return 'Email is not valid';
      case 'textfield.password.label':
        return 'Password';
      case 'textfield.password.hint':
        return 'Input your password';
      case 'textfield.password.error':
        return 'Password is not valid';
      case 'textfield.password_confirm.label':
        return 'Confirm Password';
      case 'textfield.password_confirm.hint':
        return 'Input your confirmation password';
      case 'textfield.password_confirm.error':
        return 'Confirmation password is not valid';
      case 'button.login':
        return 'Log In';
      case 'button.register':
        return 'Register';
      default:
        return null;
    }
  }
}

extension on _StringsRu {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'login.title':
        return 'Welcome to Bali Discount';
      case 'login.subtitle':
        return 'Get your discount right away';
      case 'login.no_account':
        return 'Don\'t have an account?';
      case 'register.title':
        return 'Create Your Account';
      case 'register.subtitle':
        return 'Get your discount right away';
      case 'register.have_account':
        return 'Already have an account?';
      case 'textfield.fullname.label':
        return 'Fullname';
      case 'textfield.fullname.hint':
        return 'Input your full name';
      case 'textfield.fullname.error':
        return 'Full name must not empty';
      case 'textfield.email.label':
        return 'Email';
      case 'textfield.email.hint':
        return 'Input your email';
      case 'textfield.email.error':
        return 'Email is not valid';
      case 'textfield.password.label':
        return 'Password';
      case 'textfield.password.hint':
        return 'Input your password';
      case 'textfield.password.error':
        return 'Password is not valid';
      case 'textfield.password_confirm.label':
        return 'Confirm Password';
      case 'textfield.password_confirm.hint':
        return 'Input your confirmation password';
      case 'textfield.password_confirm.error':
        return 'Confirmation password is not valid';
      case 'button.login':
        return 'Log In';
      case 'button.register':
        return 'Register';
      default:
        return null;
    }
  }
}
