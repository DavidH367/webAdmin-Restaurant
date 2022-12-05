import 'package:administraciongr/authentication/login_screen.dart';
import 'package:administraciongr/main_screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCDnV4cKDucpw5O7vq35V0r3K-g5ZiSMEs",
      appId: "1:531525381269:web:39f1dc476ccc30c111bf9c",
      messagingSenderId: "531525381269",
      projectId: "provenirsteakehouse",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AdminWeb Portal',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? const LoginScreen() : const HomeScreen(),
    );
  }
}


