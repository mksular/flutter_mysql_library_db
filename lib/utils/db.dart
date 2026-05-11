import 'dart:async';

import 'package:mysql_client/mysql_client.dart';

class ConnectionDatabase {
  
  ConnectionDatabase();

  Future<MySQLConnection> getConnection() async {
    return await MySQLConnection.createConnection(
      host: "localhost",
      port: 3306,
      userName: "root",
      password: "",
      databaseName: "library_db",
    );
  }
}
