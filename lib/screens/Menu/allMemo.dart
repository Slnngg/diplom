// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:first_app/screens/HomePage/HomePage.dart';

class allMemo extends StatelessWidget {
  const allMemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 125, 168),
        elevation: 0,
        title: const Text(
          "Бүх тэмдэглэлүүд",
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.withOpacity(0.1),
          child: Stack(
            children: [
              Container(
                  //end bichneeeee

                  ),
            ],
          )),
    );
  }
}
