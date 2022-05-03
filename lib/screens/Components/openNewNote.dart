import 'package:flutter/material.dart';

import 'HomePage.dart';

class NewNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: newNote(),
    );
  }
}

class newNote extends StatefulWidget {
  @override
  _newNoteState createState() => _newNoteState();
}

class _newNoteState extends State<newNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 125, 168),
        elevation: 0,
        title: Text(
          "Шинэ тэмдэглэл нэмэх",
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
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Тэмдэглэл бичих",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
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
                                      color: Colors.grey.withOpacity(0.5))),
                              child: TextField(
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
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15)),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5))),
                            ),
                            SizedBox(
                              height: 300,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  // String title = _titleController.text;
                                  // String description =
                                  //     _descriptionController.text;
                                  // //String date = _dateContoller.text;
                                  // print(title);
                                  // print(description);
                                  // Todo(
                                  //   //date: date,
                                  //   description: description,
                                  //   title: title,
                                  //   done: false,
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
                            //     child: Text(
                            //       "Хадгалах",
                            //       style: TextStyle(
                            //           color: Colors.white, fontSize: 18),
                            //     ),
                            //   ),
                            // )
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
