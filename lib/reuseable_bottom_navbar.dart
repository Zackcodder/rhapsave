// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhapsave/constants/colors.dart';
import 'package:rhapsave/home.dart';
import 'package:rhapsave/profile.dart';

class ReuseableBottomBar extends StatefulWidget {
  const ReuseableBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ReuseableBottomBar> createState() => _ReuseableBottomBarState();
}

class _ReuseableBottomBarState extends State<ReuseableBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: kCircleColor.withOpacity(0.6),
              offset: Offset(0, 1),
              blurRadius: 15.0),
        ],
        color: kBackground,
      ),
      child: Row(
        children: [
          //Home
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 46, right: 54),
              color: kBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/home.png',
                    color: kNavibuttonColor,
                  ),
                ],
              ),
            ),
          ),

          //Wallet change
          GestureDetector(
            // onTap: () => Navigator.pushNamed(context, EventCenter.id),
            child: Container(
              color: kBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/changewallet.png',
                      color: kNavibuttonColor),
                ],
              ),
            ),
          ),

          //Empty wallet
          GestureDetector(
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Promotion(),
            //   ),
            // ),
            child: Container(
              margin: EdgeInsets.only(left: 53.47, right: 32.03),
              color: kBackground,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/wallet.png',
                      color: kNavibuttonColor),
                ],
              ),
            ),
          ),

          // User profile
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(),
              ),
            ),
            child: Container(
              height: 48,
              // width: 99,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                color: Color.fromRGBO(246, 70, 0, 0.1),
              ),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    width: 17.34,
                  ),
                  Icon(
                    FontAwesomeIcons.user,
                    size: 20,
                    color: kPorfileColor,
                  ),
                  SizedBox(
                    width: 13.02,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                        color: kPorfileColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
