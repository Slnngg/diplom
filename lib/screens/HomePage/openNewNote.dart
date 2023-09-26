// ignore_for_file: file_names, camel_case_types

import 'package:first_app/utils/memo.dart';
import 'package:first_app/utils/memo_db.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class NewNote extends StatelessWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: const newNote(),
    );
  }
}

class newNote extends StatefulWidget {
  const newNote({Key? key}) : super(key: key);

  @override
  _newNoteState createState() => _newNoteState();
}

class _newNoteState extends State<newNote> {
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 125, 168),
        elevation: 0,
        title: const Text(
          "Шинэ тэмдэглэл нэмэх",
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
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Тэмдэглэл бичих",
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 25),
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      topLeft: Radius.circular(15)),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5))),
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
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15)),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5))),
                            ),
                            const SizedBox(height: 300),
                            MaterialButton(
                                minWidth: double.infinity,
                                height: 37,
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                  String description =
                                      _descriptionController.text;
                                  // print(description);
                                  Note tableNotes =
                                      await NotesDatabase.instance.create(Note(
                                    description: description,
                                  ));
                                  if (tableNotes.id == null) {
                                    // print("failed");
                                  } else {
                                    // print(tableNotes);
                                    // print("Success");
                                  }
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
            )
          ],
        ),
      ),
    );
  }
}
