import 'package:basic_sign_implementation/screens/auth/stream_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: Main_Page_Dart()),
  );
}
