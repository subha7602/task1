import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task1/ui/home_page.dart';
import 'package:task1/ui/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleSignInManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: '35105450802-2tg10r5srq31clk2a87dcm31vs9mbmis.apps.googleusercontent.com', // Add your client ID here
  );

  Future<User?> signUpWithGoogle(BuildContext context) async {
    // This will force users to choose their Google account every time
    await _googleSignIn.signOut();

    final GoogleSignInAccount? googleSignInAccount =
    await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleAuth =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
      await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        // Store user details in Firestore
        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'username': user.displayName,
          'email': user.email,
          'profilePicture': user.photoURL,
        });

        // Show a dialog after successful sign up
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sign Up Successful'),
              content: Text('You have successfully signed up with Google.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            );
          },
        );
      }

      return user;
    }
    return null;
  }

  Future<User?> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount =
    await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleAuth =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
      await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        // Fetch user details
        Map<String, dynamic> userDetails = await fetchUserDetails(
            user); // Replace fetchUserDetails with your actual method to get user details

        if (userDetails.isNotEmpty) {
          // After fetching details, navigate to the home page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                email: userDetails['email'],
                username: userDetails['username'],
                profilePicture: userDetails['profilePicture'],
              ),
            ),
          );
        } else {
          // Handle scenario where user details couldn't be fetched
          // You can display an error message or handle it as needed
        }
      }

      return user;
    }
    return null;
  }

  Future<Map<String, dynamic>> fetchUserDetails(User user) async {
    // Here, we're just returning some of the details available directly from the User object.
    return {
      'email': user.email,
      'username': user.displayName,
      'profilePicture': user.photoURL,
    };
  }
}

class FacebookSignin extends StatefulWidget {
  const FacebookSignin({super.key});

  @override
  State<FacebookSignin> createState() => FacebookSigninState();
}

class FacebookSigninState extends State<FacebookSignin> {
  String welcome="Facebook";
  Map<String,dynamic>? _userData;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
  Future<UserCredential> signInFacebook() async {
    final LoginResult loginResult=await FacebookAuth.instance.login(permissions: ['email,']);
    if( loginResult == LoginStatus.success){
      final userData =await FacebookAuth.instance.getUserData();
      _userData =userData;

    }
    else{
      print (loginResult.message);
    }
    setState((){
      welcome =_userData!['email'];
    });
    final OAuthCredential oAuthCredential =FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(oAuthCredential);
  }

}
