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
            onTap: () {
              
              showModalBottomSheet(
                  // isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  backgroundColor: kCircleColor,
                  context: context,
                  builder: ((context) {
                    return ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 8, bottom: 24, left: 160, right: 160),
                          height: 5,
                          width: 55,
                          color: Color.fromRGBO(38, 38, 38, 0.13),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24),
                          height: 42,
                          child: Text(
                            'Awesome',
                            style: TextStyle(
                                color: kNormaltextColor,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Poppins',
                                fontSize: 28.0,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, bottom: 16),
                          height: 99,
                          child: Text(
                            'What percentage of your\nincome would you like to\nsave?',
                            style: TextStyle(
                                color: kNormaltextColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 22.0,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, bottom: 16),
                          height: 30,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('60%')),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('70%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('80%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('90%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('100%')),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, bottom: 16),
                          height: 30,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('10%')),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('20%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('30%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('40%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('50%')),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 24, right: 24, bottom: 16),
                          child: MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Color.fromRGBO(178, 179, 179, 0.2),
                            child: Center(
                                child: Text(
                              'Enter Manually',
                              style: TextStyle(
                                  color: kNewHeaderColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.normal),
                            )),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 24, right: 24, bottom: 60),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: kPorfileColor,
                            child: Center(
                                child: Text(
                              'Create Rhapsave',
                              style: TextStyle(
                                  color: kCircleColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  fontStyle: FontStyle.normal),
                            )),
                          ),
                        ),
                      ],
                    );
                  }));
            
            },
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
            onTap: () {
              showModalBottomSheet(
                  // isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  backgroundColor: kCircleColor,
                  context: context,
                  builder: ((context) {
                    return ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 8, bottom: 24, left: 160, right: 160),
                          height: 5,
                          width: 55,
                          color: Color.fromRGBO(38, 38, 38, 0.13),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24),
                          height: 42,
                          child: Text(
                            'Awesome',
                            style: TextStyle(
                                color: kNormaltextColor,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Poppins',
                                fontSize: 28.0,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, bottom: 16),
                          height: 99,
                          child: Text(
                            'What percentage of your\nincome would you like to\nsave?',
                            style: TextStyle(
                                color: kNormaltextColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 22.0,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, bottom: 16),
                          height: 30,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('60%')),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('70%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('80%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('90%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('100%')),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, bottom: 16),
                          height: 30,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('10%')),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('20%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('30%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('40%')),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  color: Color.fromRGBO(178, 179, 179, 0.2),
                                ),
                                height: 30,
                                width: 58,
                                child: Center(child: Text('50%')),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 24, right: 24, bottom: 16),
                          child: MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Color.fromRGBO(178, 179, 179, 0.2),
                            child: Center(
                                child: Text(
                              'Enter Manually',
                              style: TextStyle(
                                  color: kNewHeaderColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  fontStyle: FontStyle.normal),
                            )),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 24, right: 24, bottom: 60),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: kPorfileColor,
                            child: Center(
                                child: Text(
                              'Create Rhapsave',
                              style: TextStyle(
                                  color: kCircleColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  fontStyle: FontStyle.normal),
                            )),
                          ),
                        ),
                      ],
                    );
                  }));
            },
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
