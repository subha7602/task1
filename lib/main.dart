import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/config.dart';
import 'package:task1/localisation_service.dart';
import 'package:task1/ui/login_screen.dart';
import 'package:task1/ui/sign_up.dart';
import 'package:task1/common/text_style.dart';
import 'package:task1/common/textfield.dart';
import 'package:task1/common/widgets.dart';
import 'ui/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp( MyApp());
}

bool isEnglish = true; // Global variable

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final  localizationController = Get.put(LocalizationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        init: localizationController,
        builder: (LocalizationController controller) {
          return MaterialApp(
            home: const SignUp(),
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
