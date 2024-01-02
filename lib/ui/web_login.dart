import 'package:task1/utils/imports.dart';

class WebLogin extends StatefulWidget {
  const WebLogin({super.key});

  @override
  State<WebLogin> createState() => _WebLoginState();
}

class _WebLoginState extends State<WebLogin> {
  void handleLogin() {}

  GoogleSignInManager googleSignInManager = GoogleSignInManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.red,
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
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  CommonTextStyle(
                    name: Tkeys.LoginL2.translate(context),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w300),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                  CommonTextStyle(
                    name: Tkeys.NotHaveAccount.translate(context),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w300),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebSignUp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // White color for the button
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Curved border
                      ),
                    ),
                    child: Text(
                      Tkeys.Signup.translate(context),
                      style: TextStyle(
                        color: Colors.red, // Text color for the button text
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
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLanguageButton(
                      buttonColor: Colors.red, textColor: Colors.white),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  CommonTextStyle(
                    name: Tkeys.LoginToAccount.translate(context),
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.w800),
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 10,
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
                          await GitHubWeb().signInGitHubWeb(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CommonTextStyle(
                    name: Tkeys.emailAccountLogin.translate(context),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w300),
                    color: Colors.black,
                  ),
                  CustomTextField(
                    hintText: Tkeys.HintEmail.translate(context),
                    controller: email_controller,
                    validator: emailValidator,
                    errorText: Tkeys.ErrorEmail.translate(context),
                    prefixIconData: Icons.mail,
                    labelText: Tkeys.LabelEmail.translate(context),
                  ),
                  CustomTextField(
                    hintText: Tkeys.HintPassword.translate(context),
                    obscureText: true,
                    textInputType: TextInputType.visiblePassword,
                    controller: password_controller,
                    errorText: Tkeys.ErrorPassword.translate(context),
                    validator: passwordValidator,
                    prefixIconData: Icons.lock,
                    labelText: Tkeys.LabelPassword.translate(context),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(
                        text: Tkeys.ForgotPassword.translate(context),
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  button(
                    buttonText: Tkeys.Login.translate(context),
                    onPressed: handleLogin,
                    buttonColor: Colors.red,
                    textColor: Colors.white,
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
