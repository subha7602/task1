import 'package:task1/utils/imports.dart';

TextEditingController name_controller = TextEditingController();
TextEditingController SignUpemail_controller = TextEditingController();
TextEditingController SignUppassword_controller = TextEditingController();
TextEditingController email_controller = TextEditingController();
TextEditingController password_controller = TextEditingController();
TextEditingController confirm_password_controller = TextEditingController();

// Email Validator
bool emailValidator(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
// Password Validator
bool passwordValidator(String value) {
  // Add your password validation logic here
  return value.length >= 8;
}
// Name Validator
bool nameValidator(String value) {
  // Add your name validation logic here
  return value.isNotEmpty;
}

bool confirmPasswordValidator(String password, String confirmPassword) {
  return password == confirmPassword;
}

void showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
void handleFormSubmission(BuildContext context) {
  String password = SignUppassword_controller.text;
  String confirmPassword = confirm_password_controller.text;

  if (!confirmPasswordValidator(password, confirmPassword)) {
    showAlertDialog(context, 'Passwords do not match.');
    return; // Do not proceed further
  }


}
