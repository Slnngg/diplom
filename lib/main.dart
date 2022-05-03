import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/constant.dart';
import 'package:first_app/screens/Components/HomePage.dart';
import 'package:first_app/screens/Components/body.dart';
import 'package:first_app/screens/Components/login.dart';
import 'package:first_app/screens/Components/signup.dart';
import 'package:first_app/screens/Welcome/Welcome_screen.dart';
import 'package:first_app/utils/db.dart';
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
