// ignore_for_file: file_names, camel_case_types
import 'package:first_app/utils/db.dart';
import 'package:first_app/utils/db_model.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/HomePage/HomePage.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: const newTask(),
    );
  }
}

class newTask extends StatefulWidget {
  const newTask({Key? key}) : super(key: key);

  @override
  _newTaskState createState() => _newTaskState();
}

class _newTaskState extends State<newTask> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime date = DateTime.now();
  DateTime? newDate = DateTime.now();
  DateTime? selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 125, 168),
        elevation: 0,
        title: const Text(
          "Шинэ зорилго нэмэх",
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 30,
              color: const Color.fromARGB(255, 255, 125, 168),
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
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.1),
                      child: TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                            hintText: " Гарчиг", border: InputBorder.none),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Дэлгэрэнгүй",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3))),
                            child: TextField(
                              controller: _descriptionController,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "  Энд бичнэ үү",
                              ),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3))),
                          ),
                          const SizedBox(height: 50),
                          const Text(
                            "Дуусах хугацаа",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 30),
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
                                //print(newDate);
                              },
                              child: Text(newDate.toString().substring(0, 10)),
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          MaterialButton(
                              minWidth: double.infinity,
                              height: 37,
                              onPressed: () async {
                                String title = _titleController.text;
                                String description =
                                    _descriptionController.text;
                                // print(title);
                                // print(description);

                                Todo newTodo =
                                    await DatabaseHelper.instance.insert(Todo(
                                  date: newDate,
                                  description: description,
                                  title: title,
                                  done: false,
                                ));
                                if (newTodo.id == null) {
                                  // print("failed");
                                } else {
                                  // print(newTodo);
                                  // print("Success");
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => const HomePage()),
                                    ));
                              },
                              color: const Color.fromARGB(255, 255, 125, 168),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Text(
                                "Хадгалах",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
