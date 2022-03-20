import 'package:flutter/material.dart';
import 'package:instagram_clone/login_page.dart';
import 'package:instagram_clone/tab_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:instagram_clon/loading_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _handleCurrentScreen();
    // return LoginPage();
    // return TabPage();
  }

  Widget _handleCurrentScreen() {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return TabPage(snapshot.data!);
          }
          return const LoginPage();
        });
  }

  // Widget _handleCurrentScreen() {
  //   return StreamBuilder<User?>(
  //     stream: FirebaseAuth.instance.authStateChanges(),
  //     builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const LoadingPage();
  //       } else {
  //         if (snapshot.hasData) {
  //           return TabPage(snapshot.data!);
  //         }
  //         return const LoginPage();
  //       }
  //     },
  //   );
  // }
}
