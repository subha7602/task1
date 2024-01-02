import 'package:task1/utils/imports.dart';

enum Tkeys {
  Welcome,
  SignupL2,
  emailAccountSignup,
  AlreadyHaveAccount,
  HintEmail,
  HintPassword,
  HintName,
  HintConfirmPassword,
  Signup,
  Login,
  WelcomeBack,
  LoginL2,
  emailAccountLogin,
  ForgotPassword,
  NotHaveAccount,
  ChooseLanguage,
  Tamil,
  English,
  LoginToAccount,
  CreateAnAccount,
  ErrorEmail,
  ErrorName,
  ErrorPassword,
  ErrorConfirmPassword,
  LabelEmail,
  LabelName,
  LabelPassword,
  LabelConfirmPassword
}

extension TKeyExtension on Tkeys {
  String get _string => toString().split('.')[1];
  String translate(context) {
    return LocalizationService.of(context).translate(_string) ?? '';
  }
}
