// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rhapsave/constants/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 24),
            child: CircleAvatar(
              child: Icon(
                Icons.notifications_outlined,
                size: 20,
                color: kPorfileColor,
              ),
              backgroundColor: kCircleColor,
              radius: 15,
            ),
          )
        ],
        leading: Container(
          margin: EdgeInsets.only(left: 24),
          child: CircleAvatar(
            backgroundColor: kCircleColor,
            child: Icon(
              Icons.menu,
              size: 20,
              color: kGeneralbodytextColor,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              child: Image.asset(
                "assets/images/header.png",
                fit: BoxFit.cover,
                alignment: AlignmentDirectional.topStart,
              ),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 150),
                child: Text('hello'),
                color: kPorfileColor,
              ),
              Container(),
            ],
          )
        ],
      ),
    );
  }
}
