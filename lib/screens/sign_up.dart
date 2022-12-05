import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          flexibleSpace: Container(),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: FaIcon(
                  FontAwesomeIcons.leftLong,
                  size: 30,
                ),
              ),
              Text(
                "Sign Up",
                style: GoogleFonts.aladin(color: Colors.white, fontSize: 35),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Sign up with either of the following below"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle,
                      color: Colors.black12,
                      border: Border.all(color: Colors.black26),
                    ),
                    child: FaIcon(FontAwesomeIcons.google),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle,
                      color: Colors.black12,
                      border: Border.all(color: Colors.black26),
                    ),
                    child: FaIcon(FontAwesomeIcons.twitter),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                TextFields(
                  text: 'Enter Your Name',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFields(
                  icon: Icon(Icons.mark_email_read_rounded),
                  text: 'Enter Your Email',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFields(
                    icon: Icon(Icons.security), text: 'Pick A Strong Password'),
                SizedBox(height: 10),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.purpleAccent, Colors.deepPurpleAccent],
                      ),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.deepPurple,
                      ),
                    ),
                    child: Text(
                      "Create Account",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aldrich(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  final String text;
  final Widget? icon;

  const TextFields({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          hintText: text,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
