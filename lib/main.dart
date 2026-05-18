import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/pages/counter.dart';
import 'package:myapp/pages/deco.dart';
import 'package:myapp/pages/flex.dart';
import 'package:myapp/pages/home.dart';

// import 'pages/counter.dart';
// import 'pages/flex.dart';
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CaolApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const HomePage(title: 'Home'),
        "/flex": (context) => const FlexPage(title: 'Flex'),
        "/deco": (context) => const DecoPage(title: 'Deco'),
        "/counter": (context) => const CounterPage(title: 'Counter'),
      },
    );
  }
}
