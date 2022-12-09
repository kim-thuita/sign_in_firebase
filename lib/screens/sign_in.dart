import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Sign_In extends StatefulWidget {
  final VoidCallback showregisterpage;

  const Sign_In({super.key, required this.showregisterpage});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final _Emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _Emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future _SignIn() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _Emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());
    }

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
                "Sign In",
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
                SizedBox(
                  height: 10,
                ),
                TextFields(
                  textedit: _Emailcontroller,
                  icon: Icon(Icons.mark_email_read_rounded),
                  text: 'Enter Your Email',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFields(
                    textedit: _passwordcontroller,
                    icon: Icon(Icons.security),
                    text: 'Pick A Strong Password'),
                SizedBox(height: 10),
                Container(
                  width: 325,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple,
                        Colors.red,
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: _SignIn,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Log In",
                      style: GoogleFonts.sourceSansPro(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("DO Not Have An Account ?"),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: widget.showregisterpage,
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.sourceSansPro(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  final String text;
  final Widget? icon;
  final TextEditingController textedit;

  const TextFields(
      {super.key, required this.text, this.icon, required this.textedit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: textedit,
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
