import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/constant.dart';
import 'package:first_app/screens/HomePage/HomePage.dart';
import 'package:first_app/screens/Welcome/body.dart';
import 'package:first_app/screens/login/login.dart';
import 'package:first_app/screens/signup/signup.dart';
import 'package:first_app/screens/welcome/Welcome_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterDemo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      //home: Body(),
      initialRoute: "/",
      routes: {
        '/': (context) => Body(),
        '/login': (context) => LogInPage(),
        '/signup': (context) => LogInPage(),
        '/landingpage': (context) => HomePage(),
      },
    );
  }
}
