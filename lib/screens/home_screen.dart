import 'package:basic_sign_implementation/screens/sign_in.dart';
import 'package:basic_sign_implementation/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.fallback(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Simply_Living",
            style: GoogleFonts.akshar(fontSize: 20, color: Colors.red),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 22),
              child: Image.asset("images/time4_image.jpg"),
            ),
            SizedBox(height: 15),
            Text(
              "Be A Better Version Of Yourself",
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              height: 55,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(
                  color: Colors.amberAccent,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "Create Account",
                style: GoogleFonts.aldrich(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have an Account ?",
                  style: GoogleFonts.aldrich(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sign_In(),
                    ),
                  ),
                  child: Text(
                    "Log In",
                    style: GoogleFonts.aldrich(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
