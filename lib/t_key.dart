import 'package:task1/localisation_service.dart';

enum Tkeys {
  Welcome,
  SignupL2,
  emailAccountSignup,
  AlreadyHaveAccount,
  Email,
  Password,
  Name,
  ConfirmPassword,
  Signup,
  Login,
  WelcomeBack,
  LoginL2,
  emailAccountLogin,
  ForgotPassword,
  NotHaveAccount,
  ChooseLanguage,
  Tamil,
  English
}

extension TKeyExtension on Tkeys {
  String get _string => toString().split('.')[1];
  String translate(context) {
    return LocalizationService.of(context).translate(_string) ?? '';
  }
}
