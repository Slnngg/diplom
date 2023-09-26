// ignore_for_file: must_be_immutable, camel_case_types, file_names
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
  DateTime today = DateTime.now();
  DateTime selectDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String taskPop = "close";
  CalendarFormat format = CalendarFormat.month;
  bool? remember;

  checkTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 125, 168),
        elevation: 0,
        title: const Text(
          "Биелүүлсэн зорилгууд",
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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Text(
                      "Today ${monthNames[selectedDay.month - 1]}, ${selectedDay.day}/${selectedDay.year}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<Todo>>(
                      future: DatabaseHelper.instance.getTodoListByDate(
                          selectedDay.toString().substring(0, 10)),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return const Text("Empty");
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return taskWidget(
                              const Color.fromARGB(255, 255, 125, 168),
                              snapshot.data![index].title ?? "",
                              snapshot.data![index].description ?? "",
                              snapshot.data![index].date.toString(),
                              snapshot.data![index].done ?? false,
                              snapshot.data![index].id ?? 0,
                              //snapshot.data![index].delete ??
                            );
                          },
                        );
                      },
                    ),
                  ),
                  // for (int i = 0; i < 3; i++)
                  //   Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                  //     child: taskWidget(Color.fromARGB(255, 255, 125, 168),
                  //         monthNames[i], "dahiad 1", "again one", true, 5),
                  //   )
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
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: const Offset(0, 9),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Checkbox(
              activeColor: const Color.fromARGB(255, 255, 125, 168),
              value: done,
              onChanged: (bool? value) {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  description,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
            // Expanded(
            //   child: Container(),
            // ),
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
