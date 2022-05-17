import 'package:first_app/screens/Menu/allMemo.dart';
import 'package:first_app/screens/Welcome/body.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/Menu/checkTask.dart';

class Menu extends StatelessWidget {
  // Size size = MediaQuery.of(context).size;
  final padding = EdgeInsets.zero;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // child: Container(color: Colors.white),
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Solongo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            accountEmail: Text(
              "sokogundalai@gmail.com",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/mountain.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Биелүүлсэн зорилгууд"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => checkTask()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: Text("Бүх тэмдэглэлүүд"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => allMemo()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Гарах"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Body()));
            },
          ),
        ],
      ),
    );
  }
}
