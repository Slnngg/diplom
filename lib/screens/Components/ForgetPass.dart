import 'package:first_app/screens/Components/ForgetPass.dart';
import 'package:first_app/screens/Components/signup.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPass extends StatelessWidget {
  get onPressed => null;

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
        body: Center(
            child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Нууц үг сэргээх?",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(children: [
                          inputFile(label: "Имэйл"),
                          //inputPass(label: "Нууц үг", obscureText: true),
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: EdgeInsets.only(top: 30, left: 3),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 37,
                            onPressed: () {},
                            // {
                            //   Navigator.push(

                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => HomePage()));
                            // }
                            // color: Color.fromARGB(255, 255, 125, 168),
                            // elevation: 0,
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(50),
                            // ),
                            color: Color.fromARGB(255, 255, 125, 168),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Аккаунт байхгүй юу? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            child: Container(
                                child: Text(
                              "Бүртгүүлэх",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 125, 168),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}

Widget inputFile({label, obscureText = false}) {
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
        // onChanged: (value) {
        //   _email = value;
        // },
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
      SizedBox(height: 5),
    ],
  );
}

// Widget inputPass({label, obscureText = false}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//       ),
//       SizedBox(
//         height: 5,
//       ),
//       TextField(
//         onChanged: (value) {
//           _password = value;
//         },
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.grey,
//             ),
//           ),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.grey,
//             ),
//           ),
//         ),
//       ),
//       SizedBox(height: 5),
//       MaterialButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: ((context) => ForgetPass())));
//         },
//         child: Text(
//           "Нууц үгээ мартсан уу",
//           textAlign: TextAlign.right,
//           style: TextStyle(
//             color: Color.fromARGB(255, 255, 125, 168),
//             fontSize: 16,
//           ),
//         ),
//       ),
//     ],
//   );
// }
