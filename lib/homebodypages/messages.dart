import 'package:flutter/material.dart';

class MessagesBody extends StatefulWidget {
  const MessagesBody({super.key, required this.title});

  final String title;

  @override
  State<MessagesBody> createState() => _MessagesBodyState();
}

class _MessagesBodyState extends State<MessagesBody> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Burası Mesajlar Sayfası"));
  }
}
