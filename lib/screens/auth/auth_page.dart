import 'package:basic_sign_implementation/screens/sign_in.dart';
import 'package:basic_sign_implementation/screens/sign_up.dart';
import 'package:flutter/material.dart';

class Auth_Page extends StatefulWidget {
  const Auth_Page({Key? key}) : super(key: key);

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

class _Auth_PageState extends State<Auth_Page> {
  bool showloginpage = true;

  void ToggleScreens() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return Sign_In(showregisterpage: ToggleScreens);
    } else {
      return Sign_Up(showloginpage: ToggleScreens);
    }
  }
}
