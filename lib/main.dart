import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/constant.dart';
import 'package:first_app/screens/HomePage/HomePage.dart';
import 'package:first_app/screens/Welcome/body.dart';
import 'package:first_app/screens/login/login.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: '',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const Body(),
        '/login': (context) => LogInPage(),
        '/signup': (context) => LogInPage(),
        '/landingpage': (context) => const HomePage(),
      },
    );
  }
}
