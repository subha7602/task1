import 'package:task1/utils/imports.dart';

class WebSignUp extends StatefulWidget {
  const WebSignUp({super.key});

  @override
  State<WebSignUp> createState() => _WebSignUpState();
}

class _WebSignUpState extends State<WebSignUp>
    with SingleTickerProviderStateMixin {
  void handleSignUp() {}
  GoogleSignInManager googleSignInManager = GoogleSignInManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextStyle(
                    name: Tkeys.CreateAnAccount.translate(context),
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
                        onTap: () {

                        },
                      ),
                      CustomImageContainer(
                        imagePath: 'assets/github.png',
                        onTap: () async {
                          await GitHubWeb().signUpWithGitHub(context);
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
                    hintText: Tkeys.HintName.translate(context),
                    controller: name_controller,
                    validator: nameValidator,
                    labelText: Tkeys.LabelName.translate(context),
                    errorText: Tkeys.ErrorName.translate(context),
                    prefixIconData: Icons.person,
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
                    controller: password_controller,
                    errorText: Tkeys.ErrorPassword.translate(context),
                    validator: passwordValidator,
                    prefixIconData: Icons.lock,
                    labelText: Tkeys.LabelPassword.translate(context),
                  ),
                  CustomTextField(
                    hintText: Tkeys.HintConfirmPassword.translate(context),
                    obscureText: true,
                    controller: confirm_password_controller,
                    prefixIconData: Icons.password_rounded,
                    labelText: Tkeys.LabelConfirmPassword.translate(context),
                    errorText: Tkeys.ErrorConfirmPassword.translate(context),
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
                  SizedBox(
                    height: 10,
                  ),
                  button(
                    buttonText: Tkeys.Signup.translate(context),
                    onPressed: handleSignUp,
                    buttonColor: Colors.red,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.red,
              child: Column(
                children: [
                  Column(
                    children: [
                      CustomLanguageButton(
                          buttonColor: Colors.white, textColor: Colors.red),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3),
                      CommonTextStyle(
                        name: Tkeys.Welcome.translate(context),
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
                        name: Tkeys.SignupL2.translate(context),
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
                        name: Tkeys.AlreadyHaveAccount.translate(context),
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
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => WebLogin()),
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
                          Tkeys.Login.translate(context),
                          style: TextStyle(
                            color:
                                Colors.red, // Text color for the button text
                            fontSize: 16, // Adjust the font size as needed
                          ),
                        ),
                      )
                    ],
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
