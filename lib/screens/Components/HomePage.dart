import 'package:first_app/utils/db.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:first_app/screens/Components/openNewNote.dart';
import 'package:first_app/screens/Components/openNewTask.dart';
import 'package:first_app/screens/Components/Menu.dart';
import '../../utils/db_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String filterType = "Өнөөдөр";
  DateTime today = new DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String taskPop = "close";
  CalendarFormat format = CalendarFormat.month;
  @override
  void initState() {
    print(today.toString());
    print(today.toIso8601String());
    super.initState();
  }

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
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    var drawer;
    final GlobalKey<ScaffoldState> _drawerscaffoldkey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _drawerscaffoldkey,
        drawer: Menu(),
        body: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                leading: IconButton(
                  onPressed: () {
                    if (_drawerscaffoldkey.currentState!.isDrawerOpen) {
                      Navigator.pop(context);
                    } else {
                      _drawerscaffoldkey.currentState!.openDrawer();
                    }
                  },
                  icon: Icon(Icons.menu),
                ),
                backgroundColor: const Color.fromARGB(255, 255, 125, 168),
                elevation: 0,
                title: const Text(
                  "Тавтай морилно уу",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  height: 70,
                  color: const Color.fromARGB(255, 255, 125, 168),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  changeFilter("Өнөөдөр");
                                },
                                child: const Text(
                                  "Өнөөдөр",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                  height: 4,
                                  width: screen.width / 2 - 10,
                                  color: (filterType == "Өнөөдөр")
                                      ? Colors.white
                                      : Colors.transparent),
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  changeFilter("Сар бүр");
                                },
                                child: const Text(
                                  "Сар бүр",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 4,
                                width: 120,
                                color: (filterType == "Сар бүр")
                                    ? Colors.white
                                    : Colors.transparent,
                              )
                            ]),
                      ])),
              (filterType == "Сар бүр")
                  ? TableCalendar(
                      focusedDay: focusedDay,
                      firstDay: DateTime(2018),
                      lastDay: DateTime(2050),
                      calendarFormat: format,
                      onFormatChanged: (CalendarFormat _format) {
                        setState(() {
                          format = _format;
                        });
                      },
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekVisible: true,
                      onDaySelected: (
                        DateTime selectDay,
                        DateTime focusDay,
                      ) {
                        setState(() {
                          selectedDay = selectDay;
                          focusedDay = focusDay;
                        });
                        print(selectDay);
                        print(focusDay);
                      },
                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(selectedDay, date);
                      },
                      calendarStyle: const CalendarStyle(
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(
                          color: Colors.white,

                          // todayDecoration: const BoxDecoration(
                          //   color: Colors.red,
                          // ),
                        ),
                      ),

                      // calendarController: ctrlr,
                      // startingDayOfWeek: StartingDayOfWeek.monday,
                      // initialCalendarFormat: CalendarFormat.week,
                    )
                  : Container(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today ${monthNames[selectedDay.month - 1]}, ${selectedDay.day}/${selectedDay.year}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<Todo>>(
                        future: DatabaseHelper.instance.getTodoListByDate(
                            selectedDay.toString().substring(0, 10)),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Container(
                              child: Text("Empty"),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return taskWidget(
                                  Colors.blue,
                                  snapshot.data![index].title ?? "",
                                  snapshot.data![index].description ?? "");
                            },
                          );
                        },
                      ),
                    ),
                    // taskWidget(Colors.blue, "Work out", "10:00 AM"),
                    // taskWidget(
                    //     Colors.red, "10 step skincare routine", "23:00 PM"),
                  ],
                ),
              ),
              Container(
                height: 110,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 25,
                      left: 0,
                      right: 0,
                      child: InkWell(
                        onTap: openTaskPop,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.topRight,
                              colors: const [Colors.white, Colors.white],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text("+",
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Color.fromARGB(255, 255, 125, 168),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            child: (taskPop == "open")
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: InkWell(
                        onTap: closeTaskPop,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: 1),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewTask()));
                                },
                                child: Container(
                                    child: Text(
                                  "Add task",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )),
                              ),
                              Container(
                                height: 1,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewNote()));
                                },
                                child: Container(
                                    child: Text(
                                  "Add memo",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )),
                              ),
                              Container(
                                height: 1,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              SizedBox(height: 1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          )
        ]));
  }

  openTaskPop() {
    taskPop = "open";
    setState(() {});
  }

  closeTaskPop() {
    taskPop = "close";
    setState(() {});
  }

  changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }

  Slidable taskWidget(Color color, String title, String time) {
    return Slidable(
      // actionPane: SlidableDrawerActionPane(),
      // actionExtentRatio: 0.3,
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0, 9),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ]),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: color,
                    width: 2,
                  )),
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
                  time,
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
}

// class NavigatorDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Drawer();
// }
