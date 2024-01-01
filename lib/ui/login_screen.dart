import 'package:flutter/material.dart';
import 'package:task1/common/validators.dart';
import 'package:task1/t_key.dart';
import 'package:task1/ui/sign_up.dart';
import 'package:task1/common/text_style.dart';
import 'package:task1/common/textfield.dart';
import 'package:task1/common/widgets.dart';
import 'package:task1/common/social_media_sigin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  void handleLogin() {
    final String email = email_controller.text;
    final String password = password_controller.text;
  }

  GoogleSignInManager googleSignInManager = GoogleSignInManager();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(

              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextStyle(
                    name: Tkeys.WelcomeBack.translate(context),
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                    color: Colors.white,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                  CommonTextStyle(
                    name: Tkeys.LoginL2.translate(context),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w300),
                    color: Colors.white,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.1,),
                  CommonTextStyle(
                    name: Tkeys.NotHaveAccount.translate(context),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w300),
                    color: Colors.white,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // White color for the button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Curved border
                      ),
                    ),
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        color: Colors.blue, // Text color for the button text
                        fontSize: 16, // Adjust the font size as needed
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomImageContainer(
                        imagePath: 'assets/google.jpg',
                        onTap: () {
                          googleSignInManager.signInWithGoogle(context);
                        },
                      ),
                      CustomImageContainer(
                        imagePath: 'assets/fb.png',
                        onTap: () {},
                      ),
                      CustomImageContainer(
                        imagePath: 'assets/linkedin.png',
                        onTap: () {},
                      ),
                    ],
                  ),
                  CommonTextStyle(
                    name: Tkeys.emailAccountLogin.translate(context),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w300),
                    color: Colors.black,
                  ),
                  SimpleTextField(
                    hintText: Tkeys.Email.translate(context),
                    controller: email_controller,
                    validator: emailValidator,
                    errorText: emailErrorText,
                    prefixIconData: Icons.mail,
                    labelText: emailLabelText,
                  ),
                  SimpleTextField(
                    hintText: Tkeys.Password.translate(context),
                    obscureText: true,
                    textInputType: TextInputType.visiblePassword,
                    controller: password_controller,
                    errorText: passwordErrorText,
                    validator: passwordValidator,
                    prefixIconData: Icons.lock,
                    labelText: passwordLabelText,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(
                        text: Tkeys.ForgotPassword.translate(context),
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  button(
                    buttonText: Tkeys.Login.translate(context),
                    onPressed: handleLogin,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
