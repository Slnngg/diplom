import 'package:first_app/utils/db.dart';
import 'package:first_app/utils/db_model.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/Components/HomePage.dart';
import 'package:sqflite/sqflite.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: newTask(),
    );
  }
}

class newTask extends StatefulWidget {
  @override
  _newTaskState createState() => _newTaskState();
}

class _newTaskState extends State<newTask> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime date = DateTime.now();
  DateTime? newDate = DateTime.now();
  DateTime? selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 125, 168),
        elevation: 0,
        title: Text(
          "Шинэ зорилго нэмэх",
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
        child: Stack(
          children: [
            Container(
              height: 30,
              color: Color.fromARGB(255, 255, 125, 168),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.1),
                      child: TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                            hintText: "Гарчиг", border: InputBorder.none),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Дэлгэрэнгүй",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3))),
                            child: TextField(
                              controller: _descriptionController,
                              maxLines: 6,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "  Энд бичнэ үү",
                              ),
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3))),
                            //child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            //children: [
                            //Container(
                            //child: IconButton(
                            //icon: Icon(
                            //Icons.attach_file,
                            //color: Colors.grey,
                            //),
                            //),
                            // )
                            //],
                            //),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Дуусах хугацаа",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.grey.withOpacity(0.1),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: () async {
                                newDate = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(2018),
                                  lastDate: DateTime(2050),
                                );
                                if (newDate == null) return;
                                setState(() {
                                  selected = newDate;
                                });
                                print(newDate);
                              },
                              child: Text(newDate.toString().substring(0, 10)),
                              // child: Text(newDate.now().toString()),
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                String title = _titleController.text;
                                String description =
                                    _descriptionController.text;
                                //String date = _dateContoller.text;

                                Todo newTodo =
                                    await DatabaseHelper.instance.insert(Todo(
                                  date: newDate,
                                  description: description,
                                  title: title,
                                  done: false,
                                ));
                                if (newTodo.id == null) {
                                  print("failed");
                                } else {
                                  print(newTodo);
                                  print("Success");
                                }
                                //Navigator.pop(HomePage());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => HomePage()),
                                    ));
                              },
                              child: Text(
                                "Хадгалах",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ))
                          // Container(
                          //   padding: EdgeInsets.symmetric(vertical: 15),
                          //   width: double.infinity,
                          //   decoration: BoxDecoration(
                          //       borderRadius:
                          //           BorderRadius.all(Radius.circular(15)),
                          //       color: Color.fromARGB(255, 255, 125, 168)),
                          //   child: Center(
                          //     child: ,
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
