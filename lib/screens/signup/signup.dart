import 'package:first_app/screens/signup/signup.dart';
import 'package:first_app/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String _email = '';
String _password = '';

class SignUpPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 20,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Бүртгүүлэх",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //SizedBox(height: 5),
                Text(
                  "Та өөрийн мэдээллийг оруулна уу",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(top: 100),
                //   height: 200,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage("assets/images/welcome.png"),
                //       fit: BoxFit.fitHeight,
                //     ),
                //   ),
                // ),
                Column(children: <Widget>[
                  inputEmail(label: "Имэйл хаягаа оруулна уу"),
                  inputPass1(label: "Нууц үгээ оруулна уу", obscureText: true),
                ]),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 37,
                    onPressed: () async {
                      try {
                        final user = await _auth.createUserWithEmailAndPassword(
                            email: _email, password: _password);

                        if (user != null) {
                          print("Success");
                          Navigator.pushNamed(context, '/singup');
                        } else {
                          print("User is not found");
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    color: Color.fromARGB(255, 255, 125, 168),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Бүртгүүлэх",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Бүртгэлтэй юу?"),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInPage()));
                      },
                      child: Text(
                        "Нэвтрэх",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 125, 168),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

Widget inputEmail({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        onChanged: (value) {
          _email = value;
        },
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
    ],
  );
}

Widget inputPass1({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        onChanged: (value) {
          _password = value;
        },
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
    ],
  );
}
