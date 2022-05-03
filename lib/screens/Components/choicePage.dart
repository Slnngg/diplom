import 'package:first_app/screens/Daily/DailyPage.dart';
import 'package:first_app/screens/Components/WeeklyPage.dart';
import 'package:first_app/screens/Components/choicePage.dart';
import 'package:first_app/screens/Components/LongTimePage.dart';
import 'package:flutter/material.dart';

class choicePage extends StatelessWidget {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 125, 168),
      body: SafeArea(
          child: Container(
        //backgroundColor: Color.fromARGB(255, 255, 125, 168)
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        //resizeToAvoidBottomInset: false,

        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(children: <Widget>[
                        Text(
                          "Зорилгын хугацааг тодорхойлох",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        //SizedBox(height: 15),
                      ]),
                      Column(
                        children: <Widget>[
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            minWidth: double.infinity,
                            height: 100,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LongTimePage()));
                            },
                            child: Text(
                              "Удаан хугацааны зорилгоо тодорхойлж түүнийгээ хянаж  хэрэгжүүлэх",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            minWidth: double.infinity,
                            height: 100,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WeeklyPage()));
                            },
                            child: Text(
                              "Өдөр тутамдаа хэрэгжүүлэх алхамуудаа хуваарьлаж хэрэгжүүлэх",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FlatButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            minWidth: double.infinity,
                            height: 100,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DailyPage()));
                            },
                            child: Text(
                              "Өнөөдрийн төлөвлөгөө",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
            ]),
      )),
    );
  }
}
