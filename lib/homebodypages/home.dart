import 'package:flutter/material.dart';
import 'package:myapp/models/book.dart';
import 'package:myapp/utils/db.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.title});

  final String title;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var db = ConnectionDatabase();
  List<Book> bookList = [];

  @override
  void initState() {
    super.initState();
    _mysqlCRUD();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Burası Ana Sayfa"));
  }

  Future _mysqlCRUD() async {
    final conn = await db.getConnection();

    await conn.connect();

    debugPrint("Connected");

    var result = await conn.execute("SELECT * FROM book");
    for (var row in result.rows) {
      bookList.add(Book(
          int.parse(row.colByName("bid").toString()),
          row.colByName("title").toString(),
          int.parse(row.colByName("aid").toString()),
          int.parse(row.colByName("catid").toString())));
    }

    for (var book in bookList) {
      debugPrint(book.title);
      
    }
  }
}
