import 'package:basic_sign_implementation/screens/home_page_screen.dart';
import 'package:basic_sign_implementation/screens/home_screen.dart';
import 'package:basic_sign_implementation/screens/landing_page.dart';
import 'package:basic_sign_implementation/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void _UpdateUser(User user) {
  print("User Id :${user.uid}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'landing_page',
      routes: {
        'home_screen': (context) => Home_Screen(
              OnSignIn: (User) => _UpdateUser,
            ),
        'sign_up': (context) => Sign_Up(),
        'home_page_screen': (context) => HomePage_Screen(),
        'landing_page': (context) => LandingPage(),
      }));
}
