// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rhapsave/constants/colors.dart';
import 'package:rhapsave/constants/text_style.dart';
import 'package:rhapsave/reuseable_bottom_navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Center(
              child: Text(
            'Create Rhapsave',
            style: TextStyle(
                color: kNewHeaderColor,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 16.0,
                fontStyle: FontStyle.normal),
          )),
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            FontAwesomeIcons.angleLeft,
            size: 20,
            color: kGeneralbodytextColor,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 76,
              child: Image.asset(
                'assets/images/header.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 40),
              decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   // alignment: Alignment.topLeft,
                  //   image: AssetImage('assets/images/dcard.png',),
                  //   fit: BoxFit.fitWidth
                  //   ),
                  color: kCircleColor.withOpacity(0.0),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff000000).withOpacity(0.5),
                        offset: Offset(
                          0,
                          30,
                        ),
                        blurRadius: 60.0)
                  ]),
              child: Image.asset(
                'assets/images/dcard.png',
                height: 148,
                width: 327,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
        bottomNavigationBar: ReuseableBottomBar(),
        );
  }
}
