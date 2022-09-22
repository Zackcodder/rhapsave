// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu_book_sharp, color: Colors.black,),
      ),body: Column(
        children: [
          Container(
            child: Text('Hello'),
          )
        ],
      ),
    );
  }
}