import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:first_app/screens/HomePage/HomePage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../utils/db.dart';
import '../../utils/db_model.dart';

class checkTask extends StatelessWidget {
  DateTime selectedDay = DateTime.now();
  var monthNames = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEPT",
    "OCT",
    "NOV",
    "DEC"
  ];

  String filterType = "Өнөөдөр";
  DateTime today = new DateTime.now();
  DateTime selectDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String taskPop = "close";
  CalendarFormat format = CalendarFormat.month;
  bool? remember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 125, 168),
        elevation: 0,
        title: Text(
          "Биелүүлсэн зорилгууд",
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      "Today ${monthNames[selectedDay.month - 1]}, ${selectedDay.day}/${selectedDay.year}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  for (int i = 0; i < 3; i++)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                      child: taskWidget(Color.fromARGB(255, 255, 125, 168),
                          monthNames[i], "dahiad 1", "again one", true, 5),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Slidable taskWidget(Color color, String title, String description,
      String time, bool done, int id) {
    return Slidable(
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 2,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 10,
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0, 9),
            blurRadius: 20,
            spreadRadius: 1,
          ),
          //Icon(Icons.delete);
        ]),
        child: Row(
          children: [
            Checkbox(
              activeColor: Color.fromARGB(255, 255, 125, 168),
              value: done,
              onChanged: (bool? value) {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 50,
              width: 5,
              color: color,
            )
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
