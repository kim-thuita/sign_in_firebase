import 'package:basic_sign_implementation/screens/sign_in.dart';
import 'package:basic_sign_implementation/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Simply_Living",
            style: GoogleFonts.akshar(fontSize: 20, color: Colors.amber),
          ),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 150, horizontal: 20),
              child: Icon(
                FontAwesomeIcons.airbnb,
                size: 100,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Sign_Up())),
                  child: Container(
                    alignment: Alignment.center,
                    width: 325,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.red],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Create Account",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already Have An Account ?"),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sign_In(),
                              ),
                            ),
                        child: Text(
                          "Log In",
                          style: GoogleFonts.openSans(
                              color: Colors.grey, fontSize: 20),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
