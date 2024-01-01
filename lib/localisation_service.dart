import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:task1/t_key.dart';

class LocalizationService {
  late final Locale locale;
  late final Locale currentLocale;
  LocalizationService(this.locale){
    currentLocale=locale;
  }
  static LocalizationService of(BuildContext context) {
    return Localizations.of(context, LocalizationService)!;
  }

  late Map<String, String> _localizedString;
  Future<void> load() async {
    final jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    _localizedString =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedString[key];
  }

  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('ta', ' '),
  ];

  static Locale? localeResolutionCallBack(
      Locale? locale, Iterable<Locale>? supportedLocales) {
    if (supportedLocales != null && locale != null) {
      return supportedLocales.firstWhere(
          (element) => element.languageCode == locale.languageCode,
          orElse: () => supportedLocales.first);
    }
    return null;
  }

  static const LocalizationsDelegate<LocalizationService> _delegate =
      _LocalizationServiceDelegate();

  static const localizationDelegate = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    _delegate,
  ];
}

class _LocalizationServiceDelegate
    extends LocalizationsDelegate<LocalizationService> {
  const _LocalizationServiceDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ta'].contains(locale.languageCode);
  }

  @override
  Future<LocalizationService> load(Locale locale) async {
    LocalizationService service = LocalizationService(locale);
    await service.load();
    return service;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<LocalizationService> old) {
    return false;
  }
}
class LocalizationController extends GetxController {
  late String selectedLanguage;
  late LocalizationService localizationService;
  late BuildContext context;

  LocalizationController() {
    initLocalizationService(LocalizationService(Locale('en', 'US')));
  }

  void initLocalizationService(LocalizationService service) {
    localizationService = service;
  }

  String get currentLanguage => localizationService.currentLocale.languageCode;

  void toggleLanguage(BuildContext context) {
    selectedLanguage = Tkeys.English.translate(context);
    if (localizationService.currentLocale.languageCode == 'ta' && selectedLanguage != Tkeys.Tamil.translate(context)) {
      localizationService = LocalizationService(Locale('en', 'US'));
      selectedLanguage = Tkeys.English.translate(context);
    } else if (localizationService.currentLocale.languageCode != 'ta' && selectedLanguage != Tkeys.English.translate(context)) {
      localizationService = LocalizationService(Locale('ta', ''));
      selectedLanguage = Tkeys.Tamil.translate(context);
    }
    update();
  }
}
