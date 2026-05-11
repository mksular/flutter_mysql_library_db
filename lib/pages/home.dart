import 'package:flutter/material.dart';
import 'package:myapp/homebodypages/home.dart';
import 'package:myapp/homebodypages/messages.dart';
import 'package:myapp/homebodypages/notifications.dart';
import 'package:myapp/utils/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  List bodies=[
    const HomeBody(title: "Ana Sayfa Body"),
    const NotificationsBody(title: "Bildirimler Body"),
    const MessagesBody(title: "Mesajlar Body")
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const MyDrawer(title: "Drawer"),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Ana Sayfa',
          ),
          NavigationDestination(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Yazarlar',
          ),
          NavigationDestination(
            icon: Icon(Icons.category),
            label: 'Kategoriler',
          ),
        ],
      ),
      body: bodies[currentPageIndex],
    );
  }
}
