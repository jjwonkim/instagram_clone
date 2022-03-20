import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FireBaseAuth _auth = FireBaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Instagram Clon', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
            Padding(padding: EdgeInsets.all(50)),
            SignInButton(
              Buttons.Google,
              onPressed: () {
                signInWithGoogle();
              },
            )
          ],
        ),
      ),
    );
  }

  // https://github.com/junsuk5/flutter_insta_clon/blob/null-safety/lib/login_page.dart
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = (await googleUser?.authentication)!;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
