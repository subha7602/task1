import 'package:task1/utils/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  bool kisweb;
  try {
    if (Platform.isAndroid || Platform.isIOS) {
      kisweb = false;
    } else {
      kisweb = true;
    }
  } catch (e) {
    kisweb = true;
  }

  runApp(MyApp(kisweb: kisweb));
}

class MyApp extends StatelessWidget {
  final bool kisweb;
  MyApp({Key? key, required this.kisweb}) : super(key: key);
  final localizationController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        init: localizationController,
        builder: (LocalizationController controller) {
          Widget homePage;
          if (kisweb) {
            homePage = WebSignUp(); // Replace with your actual web sign up page
          } else {
            homePage = SignUp();
          }

          return GetMaterialApp(
            home: homePage,
            locale: controller.currentLanguage != ''
                ? Locale(controller.currentLanguage, '')
                : null,
            localeResolutionCallback:
                LocalizationService.localeResolutionCallBack,
            supportedLocales: LocalizationService.supportedLocales,
            localizationsDelegates: LocalizationService.localizationDelegate,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
