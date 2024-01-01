import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task1/common/validators.dart';
import 'package:task1/localisation_service.dart';
import 'package:task1/t_key.dart';
import 'package:task1/utils/packages.dart';
import 'package:task1/common/social_media_sigin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin{
    final localizationController = Get.find<LocalizationController>();
  String selectedLanguage = 'English'; // Initially set to English
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController confirm_password_controller = TextEditingController();

    AnimationController? _controller;
    Animation<double>? _animation;

    @override
    void initState() {
      super.initState();

      _controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      );

      _animation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeOutCubic,
      ));

      _controller!.forward();
    }

    @override
    void dispose() {
      super.dispose();
      _controller?.dispose();
    }
  
  void handleSignUp() {}
  GoogleSignInManager googleSignInManager = GoogleSignInManager();
  FacebookSignin facebookSignin = FacebookSignin();
  String welcome = "Facebook";
  Map<String, dynamic>? _userData;
  Future<UserCredential> signInFacebook() async {
    final LoginResult loginResult =
        await FacebookAuth.instance.login(permissions: ['email,']);
    if (loginResult == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(loginResult.message);
    }
    setState(() {
      welcome = _userData!['email'];
    });
    final OAuthCredential oAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(oAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Row(
        children: [
          Expanded(
            flex: 5,
            child: AnimatedBuilder(
              animation: _animation!,
              builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_animation!.value * MediaQuery.of(context).size.width, 0),// change 200 to desired height
                    child: child,
                  );
                },
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
                      SimpleTextField(
                        hintText: Tkeys.Name.translate(context),
                        controller: name_controller,
                        validator: nameValidator,
                        labelText: nameLabelText,
                        errorText: nameErrorText,
                        prefixIconData: Icons.person,
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
                      SimpleTextField(
                        hintText: Tkeys.ConfirmPassword.translate(context),
                        obscureText: true,
                        textInputType: TextInputType.visiblePassword,
                        controller: confirm_password_controller,
                        prefixIconData: Icons.password_rounded,
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
                        buttonText: Tkeys.Signup.translate(context),
                        onPressed: handleSignUp,
                      ),
                    ],
                  ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  ElevatedButton(

                      onPressed: () {
                        _controller?.forward().then((value) => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        ));
                      },


                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // White color for the button
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // Curved border
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color:
                            Colors.blue, // Text color for the button text
                        fontSize: 16, // Adjust the font size as needed
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
