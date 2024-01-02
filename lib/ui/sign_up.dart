import 'package:task1/utils/imports.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final localizationController = Get.find<LocalizationController>();



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
              children: [
                CustomLanguageButton(
                    buttonColor: Colors.white, textColor: Colors.red),
                CommonTextStyle(
                  name: Tkeys.Welcome.translate(context),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                  color: Colors.white,

                ),
                //spaceBox(),
                CommonTextStyle(
                  name: Tkeys.SignupL2.translate(context),
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
                        googleSignInManager.signUpWithGoogle(context);
                      }, // Replace with your actual image asset path
                    ),
                    CustomImageContainer(
                      imagePath: 'assets/fb.png',
                      onTap: () {
                        //signInFacebook();
                      }, // Replace with your actual image asset path
                    ),
                    CustomImageContainer(
                      imagePath: 'assets/github.png',
                      onTap: () async {
                        await GitHub().signUpWithGithub();
                      }, // Replace with your actual image asset path
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                CommonTextStyle(
                  name: Tkeys.emailAccountSignup.translate(context),
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
                hintText: Tkeys.HintName.translate(context),
                      controller:name_controller,
                      validator: nameValidator,

                      errorText: Tkeys.ErrorName.translate(context),
                      prefixIconData: Icons.person,
                    ),
                    CustomTextField(
                      hintText: Tkeys.HintEmail.translate(context),
                      controller:  SignUpemail_controller,
                      validator: emailValidator,
                      errorText: Tkeys.ErrorEmail.translate(context),
                      prefixIconData: Icons.mail,
                    ),
                    CustomTextField(
                      hintText: Tkeys.HintPassword.translate(context),
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                      controller:  SignUppassword_controller,
                      validator: passwordValidator,
                      errorText: Tkeys.ErrorPassword.translate(context),
                      prefixIconData: Icons.lock,
                    ),
                    CustomTextField(
                      hintText: Tkeys.HintConfirmPassword.translate(context),
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                      controller: confirm_password_controller,
                      validator: passwordValidator,
                      errorText: Tkeys.ErrorConfirmPassword.translate(context),
                      prefixIconData: Icons.password_rounded,
                    ),
                  ],
                ),
                button(
                  buttonText: Tkeys.Signup.translate(context),
                  onPressed: () =>handleFormSubmission(context),
                  buttonColor: Colors.white,
                  textColor: Colors.red,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: CommonTextStyle(
                          name: Tkeys.AlreadyHaveAccount.translate(context),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.w300),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            text: Tkeys.Login.translate(context),
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
