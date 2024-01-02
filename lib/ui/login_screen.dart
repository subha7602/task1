import 'package:task1/utils/imports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void handleLogin() {}

  GoogleSignInManager googleSignInManager = GoogleSignInManager();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLanguageButton(
                    buttonColor: Colors.white, textColor: Colors.red),
                CommonTextStyle(
                  name: Tkeys.WelcomeBack.translate(context),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                  color: Colors.white,
                ),
                //spaceBox(),
                CommonTextStyle(
                  name: Tkeys.LoginL2.translate(context),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w300),
                  color: Colors.white,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 5,
                ),
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
                      imagePath: 'assets/github.png',
                      onTap: () async {
                        await GitHub().signInWithGithub(context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                CommonTextStyle(
                  name: Tkeys.emailAccountLogin.translate(context),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w300),
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    CustomTextField(
                      hintText: Tkeys.HintEmail.translate(context),
                      controller: email_controller,
                      prefixIconData: Icons.mail,
                      validator: emailValidator,
                      errorText: Tkeys.ErrorEmail.translate(context),

                    ),
                    CustomTextField(
                      hintText: Tkeys.HintPassword.translate(context),
                      obscureText: true,
                      validator: passwordValidator,
                      controller: password_controller,
                      prefixIconData: Icons.lock,
                      errorText: Tkeys.ErrorPassword.translate(context),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text.rich(
                    TextSpan(
                      text: Tkeys.ForgotPassword.translate(context),
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                button(
                  buttonText: Tkeys.Login.translate(context),
                  onPressed: handleLogin,
                  buttonColor: Colors.white,
                  textColor: Colors.red,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: CommonTextStyle(
                        name: Tkeys.NotHaveAccount.translate(context),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w300),
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            text: Tkeys.Signup.translate(context),
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
