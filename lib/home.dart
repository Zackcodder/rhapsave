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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [ 
          Container(
            height: 76,
            child: Image.asset('assets/images/header.png', fit: BoxFit.fitWidth,),
          )
        ],
      ),
      bottomNavigationBar: ReuseableBottomBar(),
    );
  }
}
