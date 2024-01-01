import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task1/common/widgets.dart';
import 'package:task1/t_key.dart';
import 'package:task1/ui/login_screen.dart';

class HomePage extends StatelessWidget {
  final String email;
  final String username;
  final String profilePicture;

  // Constructor to receive user details
  HomePage({required this.email, required this.username, required this.profilePicture});
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(profilePicture),
              radius: 50.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Username: $username',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 18.0),
            ),
            button(
              buttonText:'LogOut',
              onPressed: () async {
                await _googleSignIn.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()),
                );

              },
            )

            // Add more details if needed
          ],
        ),
      ),
    );
  }
}
