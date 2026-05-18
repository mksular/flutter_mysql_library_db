import 'dart:async';

import 'package:mysql_client/mysql_client.dart';

class ConnectionDatabase {
  
  ConnectionDatabase();

  Future<MySQLConnection> getConnection() async {
    return await MySQLConnection.createConnection(
      host: "server.ideapark.com.tr",
      port: 3307,
      userName: "library_user",
      password: "librarY123456.",
      databaseName: "library_db",
    );
  }
}
