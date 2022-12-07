import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home_Page_Screen extends StatefulWidget {
  const Home_Page_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Page_Screen> createState() => _Home_Page_ScreenState();
}

class _Home_Page_ScreenState extends State<Home_Page_Screen> {
  final user = FirebaseAuth.instance.currentUser!;

  Future _SignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_circle_left_rounded)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Signed iN As :${user.email}",
            ),
          ),
          ElevatedButton(onPressed: _SignOut, child: Text("Sign Out"))
        ],
      ),
    );
  }
}
