import 'package:first_app/screens/Components/login.dart';
import 'package:first_app/screens/Components/signup.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //niit delgetsiin ondor orgon
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(children: <Widget>[
              Text(
                "Тавтай морил",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/main.png"))),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Genius is 1% inspiration, 99% perspiration",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Хувь хүн өөрийн тодорхойлсон зорилгоо хэрэгжүүлэхэд алхам алхамаар туслах аппликейшн",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    color: Color.fromARGB(255, 255, 125, 168),
                    minWidth: double.infinity,
                    height: 37,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogInPage()));
                    },
                    child: Text(
                      "Эхлэх",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ],
      ),
    )));
  }
}
