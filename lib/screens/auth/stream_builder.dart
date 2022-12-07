import 'package:basic_sign_implementation/screens/auth/auth_page.dart';
import 'package:basic_sign_implementation/screens/home_page.dart';
import 'package:basic_sign_implementation/screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Main_Page_Dart extends StatefulWidget {
  @override
  State<Main_Page_Dart> createState() => _Main_Page_DartState();
}

class _Main_Page_DartState extends State<Main_Page_Dart> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Home_Page_Screen();
        } else {
          return Auth_Page();
        }
      },
    );
  }
}
