import 'package:task1/utils/imports.dart';

class LocalizationService {
  late final Locale locale;
  late final Locale currentLocale;
  LocalizationService(this.locale) {
    currentLocale = locale;
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

  void changeLanguage(String languageCode) {
    Locale newLocale;
    switch (languageCode) {
      case 'en':
        newLocale = Locale('en', 'US');
        break;
      case 'ta':
        newLocale = Locale('ta', ' ');
        break;
      default:
        newLocale = Locale('en', 'US');
    }
    localizationService = LocalizationService(newLocale);
    localizationService.load();
    Get.updateLocale(newLocale);
  }
}
