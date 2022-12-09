import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.amberAccent,
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.home),
          ),
          IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.user))
        ],
      ),
    );
  }
}
