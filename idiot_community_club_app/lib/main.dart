import 'package:flutter/material.dart';
import 'package:idiot_community_club_app/Routes/IdiotRoutes.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: IdiotRoutes.routes,
    );
  }
}
