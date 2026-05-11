import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.title});

  final String title;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          UserAccountsDrawerHeader(
                decoration:const BoxDecoration(color: Colors.white),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(child: Image.asset("assets/images/avatar2.jpg")),
                ),
                accountName:const Text(
                  "Mehmet kasım Sular",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail:const Text(
                  "mksular@gmail.com",
                  style: TextStyle(color: Colors.black),
                )),
          
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text("Ana Sayfa "),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/counter');
            },
            child: const ListTile(
              leading: Icon(Icons.control_point_outlined),
              title: Text("Counter"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/deco');
            },
            child: const ListTile(
              leading: Icon(Icons.color_lens),
              title: Text("Deco"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/flex');
            },
            child: const ListTile(
              leading: Icon(Icons.stay_current_landscape),
              title: Text("Flex"),
            ),
          )
        ],
      ),
    );
  }
}
