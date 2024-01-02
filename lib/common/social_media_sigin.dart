import 'package:task1/utils/imports.dart';

class GoogleSignInManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '35105450802-2tg10r5srq31clk2a87dcm31vs9mbmis.apps.googleusercontent.com', // Add your client ID here
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
class FacebookSignIn{
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}



class WebFacebookSignIn  {

  Future<UserCredential> signInWithFacebook() async {
  // Create a new provider
  FacebookAuthProvider facebookProvider = FacebookAuthProvider();

  facebookProvider.addScope('email');
  facebookProvider.setCustomParameters({
  'display': 'popup',
  });

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithPopup(facebookProvider);

  // Or use signInWithRedirect
  // return await FirebaseAuth.instance.signInWithRedirect(facebookProvider);
  }
  FacebookAuthProvider facebookProvider = FacebookAuthProvider();
  //
  // facebookProvider.addScope('email');
  // facebookProvider.setCustomParameters({
  // 'display': 'popup',
  // });
}


class GitHub {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signUpWithGithub() async {
    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    UserCredential userCredential =
        await _auth.signInWithProvider(githubAuthProvider);

    // Store user details in Firestore
    FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'displayName': userCredential.user!.displayName,
      'photoURL': userCredential.user!.photoURL,
      'email': userCredential.user!.email,
    });

    return userCredential;
  }

  Future<UserCredential> signInWithGithub(BuildContext context) async {
    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    UserCredential userCredential =
        await _auth.signInWithProvider(githubAuthProvider);

    // Fetch user details from Firestore
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .get();
// Set a default username if it's null in Firestore
    String username = userDoc['displayName'] ?? 'John';
    // Pass user details to homepage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          username: username,
          profilePicture: userDoc['photoURL'],
          email: userDoc['email'],
        ),
      ),
    );

    return userCredential;
  }
}

signOutGitHub() async {
  await FirebaseAuth.instance.signOut();
}

class GitHubWeb {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signInGitHubWeb(BuildContext context) async {
    Future<Map<String, dynamic>> fetchUserData(String uid) async {
      DocumentSnapshot docSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return docSnapshot.data() as Map<String, dynamic>;
    }

    try {
      User? user;
      // Trigger GitHub sign-in process
      if (_auth.currentUser == null) {
        GithubAuthProvider githubAuthProvider = GithubAuthProvider();
        UserCredential userCredential =
            await _auth.signInWithPopup(githubAuthProvider);
        user = userCredential.user;

        // Fetch user data from Firestore
        Map<String, dynamic> userDoc = await fetchUserData(user!.uid);
// Set a default username if it's null in Firestore
        String username = userDoc['displayName'] ?? 'John';
        // Navigate to the desired page with user details
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              username: username,
              profilePicture: userDoc['photoURL'],
              email: userDoc['email'],
            ),
          ),
        );
      } else {
        user = _auth.currentUser;
      }
    } catch (e) {
      // Handle errors here
      print('GitHub sign-in error: $e');
    }
  }

  Future<void> signUpWithGitHub(BuildContext context) async {
    try {
      GithubAuthProvider githubAuthProvider = GithubAuthProvider();
      UserCredential userCredential =
          await _auth.signInWithPopup(githubAuthProvider);

      // Store user details in Firestore during signup
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'displayName': userCredential.user!.displayName,
        'photoURL': userCredential.user!.photoURL,
        'email': userCredential.user!.email,
      });

      // Navigate to home page after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } catch (e) {
      // Handle signup errors here
      print('GitHub signup error: $e');
    }
  }
}
