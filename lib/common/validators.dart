// validators.dart
import 'package:flutter/material.dart';
// Email Validator
bool emailValidator(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
String emailErrorText = 'Enter a valid email';
String emailLabelText="Email";

// Password Validator
bool passwordValidator(String value) {
  // Add your password validation logic here
  return value.length >= 8;
}
String passwordErrorText = 'Enter a valid password';
String passwordLabelText="Password";

// Name Validator
bool nameValidator(String value) {
  // Add your name validation logic here
  return value.isNotEmpty;
}
String nameErrorText = 'Enter a valid name';
String nameLabelText="Name";





// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: SingleChildScrollView(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CommonTextStyle(
//           name: Tkeys.Welcome.translate(context),
//           style: Theme.of(context)
//               .textTheme
//               .displaySmall!
//               .copyWith(fontWeight: FontWeight.bold),
//           color: Colors.white,
//         ),
//         //spaceBox(),
//         CommonTextStyle(
//           name: Tkeys.SignupL2.translate(context),
//           style: Theme.of(context)
//               .textTheme
//               .titleLarge!
//               .copyWith(fontWeight: FontWeight.w300),
//           color: Colors.white,
//         ),
//         SizedBox(height: 5,),
//         Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
//           children: [
//           CustomImageContainer(
//             imagePath: 'assets/google.jpg',
//             onTap: () {
//               googleSignInManager.signInWithGoogle(context);
//             },
//           ),
//           CustomImageContainer(
//             imagePath: 'assets/fb.png',
//             onTap: (){
//
//             },
//           ),
//           CustomImageContainer(
//             imagePath: 'assets/linkedin.png',
//             onTap: (){
//
//               },
//           ),],),
//         SizedBox(height: 5,),
//         CommonTextStyle(
//           name: Tkeys.emailAccountLogin.translate(context),
//           style: Theme.of(context)
//               .textTheme
//               .titleSmall!
//               .copyWith(fontWeight: FontWeight.w300),
//           color: Colors.white,
//         ),
//         SizedBox(height: 5,),
//         Column(
//           children: [
//             SimpleTextField(
//               hintText: Tkeys.Email.translate(context),
//               controller: email_controller,
//               prefixIconData: Icons.mail,
//             ),
//             SimpleTextField(
//               hintText: Tkeys.Password.translate(context),
//               obscureText: true,
//               textInputType: TextInputType.visiblePassword,
//               controller: password_controller,
//               prefixIconData: Icons.lock,
//             ),
//           ],
//         ),
//         TextButton(
//           onPressed: () {
//             },
//           child: Text.rich(
//             TextSpan(
//               text: Tkeys.ForgotPassword.translate(context),
//               style: TextStyle(
//                 decoration: TextDecoration.underline,
//                 decorationColor: Colors.white,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         button(
//           buttonText: Tkeys.Login.translate(context),
//           onPressed: handleLogin,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               flex: 3,
//               child: CommonTextStyle(
//                 name: Tkeys.NotHaveAccount.translate(context),
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleSmall!
//                     .copyWith(fontWeight: FontWeight.w300),
//                 color: Colors.white,
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child:
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SignUp()),
//                   );
//                 },
//                 child: Text.rich(
//                   TextSpan(
//                     text: Tkeys.Signup.translate(context),
//                     style: TextStyle(
//                       decoration: TextDecoration.underline,
//                       decorationColor: Colors.white,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//
//     ),
//   ),
// ),
//-------------------------------------------------signup---------------------------------------
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: SingleChildScrollView(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// CommonTextStyle(
// name: Tkeys.Welcome.translate(context),
// style: Theme.of(context)
//     .textTheme
//     .displaySmall!
//     .copyWith(fontWeight: FontWeight.bold),
// color: Colors.white,
// ),
// //spaceBox(),
// CommonTextStyle(
// name: Tkeys.SignupL2.translate(context),
// style: Theme.of(context)
//     .textTheme
//     .titleLarge!
//     .copyWith(fontWeight: FontWeight.w300),
// color: Colors.white,
// ),
// SizedBox(
// height: 5,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// CustomImageContainer(
// imagePath: 'assets/google.jpg',
// onTap: () {
// googleSignInManager.signUpWithGoogle(context);
//
// }, // Replace with your actual image asset path
// ),
// CustomImageContainer(
// imagePath: 'assets/fb.png',
// onTap: () {
//
// signInFacebook();
// }, // Replace with your actual image asset path
// ),
// CustomImageContainer(
// imagePath: 'assets/linkedin.png',
// onTap: () {}, // Replace with your actual image asset path
// ),
// ],
// ),
// SizedBox(
// height: 5,
// ),
// CommonTextStyle(
// name: Tkeys.emailAccountSignup.translate(context),
// style: Theme.of(context)
//     .textTheme
//     .titleSmall!
//     .copyWith(fontWeight: FontWeight.w300),
// color: Colors.white,
// ),
//
// SizedBox(
// height: 5,
// ),
// Column(
// children: [
// SimpleTextField(
// hintText: Tkeys.Name.translate(context),
// controller: name_controller,
// validator: nameValidator,
// labelText: nameLabelText,
// errorText: nameErrorText,
// prefixIconData: Icons.person,
// ),
// SimpleTextField(
// hintText: Tkeys.Email.translate(context),
// controller: email_controller,
// validator: emailValidator,
// errorText: emailErrorText,
// labelText: emailLabelText,
// prefixIconData: Icons.mail,
// ),
// SimpleTextField(
// hintText: Tkeys.Password.translate(context),
// obscureText: true,
// textInputType: TextInputType.visiblePassword,
// controller: password_controller,
// validator: passwordValidator,
// errorText: passwordErrorText,
// labelText: passwordLabelText,
// prefixIconData: Icons.lock,
// ),
// SimpleTextField(
// hintText: Tkeys.ConfirmPassword.translate(context),
// obscureText: true,
// textInputType: TextInputType.visiblePassword,
// controller: confirm_password_controller,
// prefixIconData: Icons.password_rounded,
// ),
// ],
// ),
// button(
// buttonText: Tkeys.Signup.translate(context),
// onPressed: handleSignUp,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Expanded(
// flex: 4,
// child: Center(
// child: CommonTextStyle(
// name: Tkeys.AlreadyHaveAccount.translate(context),
// style: Theme.of(context)
//     .textTheme
//     .titleSmall!
//     .copyWith(fontWeight: FontWeight.w300),
// color: Colors.white,
// ),
// ),
// ),
// Expanded(
// flex: 2,
// child: TextButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => LoginPage()),
// );
// },
// child: Text.rich(
// TextSpan(
// text: Tkeys.Login.translate(context),
// style: TextStyle(
// decoration: TextDecoration.underline,
// decorationColor: Colors.white,
// color: Colors.white,
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),s