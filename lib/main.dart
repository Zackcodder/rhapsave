// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// My OWn Package
import 'package:rhapsave/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rhapsave",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Poppins",
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          elevation: 1.0,
        ),
        primaryColor: Colors.blue,
      ),
      home: Home(),
    );
  }
}
