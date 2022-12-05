import 'package:basic_sign_implementation/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home_Screen extends StatefulWidget {
  final Function(User) OnSignIn;

  const Home_Screen({super.key, required this.OnSignIn});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  User? user;
  Future<void> _SignInAnonimously() async {
    try {
      final usercredentials = await FirebaseAuth.instance.signInAnonymously();
      widget.OnSignIn(usercredentials.user!);
      print("UserId:${usercredentials.user?.uid}");
    } catch (e) {
      print(e.toString());
    }
  }

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
            GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Sign_Up())),
              child: Container(
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
            ),
            SizedBox(height: 60),
            Container(
              height: 55,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
                onPressed: _SignInAnonimously,
                child: Text(
                  "Sign IN Anonymously",
                  style: GoogleFonts.aldrich(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
