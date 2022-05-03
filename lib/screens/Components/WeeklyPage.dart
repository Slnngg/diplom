// ignore_for_file: deprecated_member_use

import 'package:first_app/screens/Components/WeeklyPage.dart';
import 'package:flutter/material.dart';

class WeeklyPage extends StatelessWidget {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 255, 125, 168),
        body: SafeArea(
            child: Container(
                //width: double.infinity,
                //height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      "Түр хугацааны зорилго",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 550,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Таны зорилго хэр удаан үргэлжлэх вэ?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
