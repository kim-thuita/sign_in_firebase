import 'package:basic_sign_implementation/screens/home_screen.dart';
import 'package:basic_sign_implementation/screens/sign_in.dart';
import 'package:basic_sign_implementation/screens/sign_up.dart';
import 'package:basic_sign_implementation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen': (context) => SplashScreen(),
        'home_screen': (context) => Home_Screen(),
        'sign_up': (context) => Sign_Up(),
        'sign_in': (context) => Sign_In(),
      }));
}
