// ignore_for_file: file_names
import 'package:first_app/screens/Menu/allMemo.dart';
import 'package:first_app/screens/Welcome/body.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/Menu/checkTask.dart';

class Menu extends StatelessWidget {
  // Size size = MediaQuery.of(context).size;
  final padding = EdgeInsets.zero;

  const Menu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // child: Container(color: Colors.white),
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
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
              //   image: DecorationImage(
              // image: AssetImage("assets/images/mountain.jpg"),
              // fit: BoxFit.cover,
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Биелүүлсэн зорилгууд"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => checkTask()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.note),
            title: const Text("Бүх тэмдэглэлүүд"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const allMemo()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Гарах"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Body()));
            },
          ),
        ],
      ),
    );
  }
}
