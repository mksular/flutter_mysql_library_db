import 'package:flutter/material.dart';

class NotificationsBody extends StatefulWidget {
  const NotificationsBody({super.key, required this.title});

  final String title;

  @override
  State<NotificationsBody> createState() => _NotificationsBodyState();
}

class _NotificationsBodyState extends State<NotificationsBody> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Burası Bildirimler Sayfası"));
  }
}
