import 'package:basic_sign_implementation/screens/home_page_screen.dart';
import 'package:basic_sign_implementation/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Sign_In extends StatefulWidget {
  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController _textEditingemail = TextEditingController();
  final TextEditingController _textEditingpassword = TextEditingController();

  Future<void> Log_In(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Was Successfull"),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomePage_Screen(),
                )),
              })
          .catchError((e) {
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
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
                  Text("Log in with either of the following options below"),
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
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _textEditingemail,
                    autofocus: false,
                    textAlign: TextAlign.start,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your password");
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Enter a Valid Email");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _textEditingemail.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mark_email_read_outlined),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintText: 'Enter Your Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _textEditingpassword,
                    obscureText: true,
                    autofocus: false,
                    textAlign: TextAlign.start,
                    validator: (value) {
                      RegExp regExp = RegExp("R'^.{6,}%");
                      if (value!.isEmpty) {
                        return ("Password is required");
                      }
                      if (!regExp.hasMatch(value)) {
                        return ("PLease Enter a valid Password(Min. 6 character");
                      }
                    },
                    onSaved: (value) {
                      _textEditingpassword.text = value!;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key_outlined),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintText: 'Enter your passsword',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () =>
                      Log_In(_textEditingemail.text, _textEditingpassword.text),
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
                      "Log in",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aldrich(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do not have an Account ?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sign_Up(),
                        ),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
