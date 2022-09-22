// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhapsave/constants/colors.dart';
import 'package:rhapsave/constants/text_style.dart';
import 'package:rhapsave/reuseable_bottom_navbar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              radius: 20,
            ),
          )
        ],
        leading: Container(
          decoration: BoxDecoration(color: kBackground, shape: BoxShape.circle),
          height: 40,
          margin: EdgeInsets.only(left: 24),
          child: Icon(
            Icons.menu,
            size: 20,
            color: kGeneralbodytextColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: kBackground,
                height: 150,
                width: 400,
                child: Image.asset(
                  "assets/images/header.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                  height: 440,
                  width: 328,
                  color: kBackground,
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            color: kCircleColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff000000).withOpacity(0.5),
                                  offset: Offset(
                                    0,
                                    30,
                                  ),
                                  blurRadius: 30.0)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15.09),
                              width: 17.83,
                              height: 19.99,
                              child: Image.asset('assets/images/safe.png'),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 11.08),
                                width: 248,
                                height: 20,
                                child: Text(
                                  'Security',
                                  style: kInfobodytextstyle,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16.33, bottom: 11),
                              width: 6.33,
                              height: 11.67,
                              child: Icon(
                                FontAwesomeIcons.angleRight,
                                color: kBodyColor,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            color: kCircleColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff000000).withOpacity(0.5),
                                  offset: Offset(
                                    0,
                                    30,
                                  ),
                                  blurRadius: 30.0)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15.09),
                              width: 17.83,
                              height: 19.99,
                              child: Icon(
                                FontAwesomeIcons.wallet,
                                color: kPorfileColor,
                                size: 18,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 11.08),
                                width: 248,
                                height: 20,
                                child: Text(
                                  'Cards',
                                  style: kInfobodytextstyle,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16.33, bottom: 11),
                              width: 6.33,
                              height: 11.67,
                              child: Icon(
                                FontAwesomeIcons.angleRight,
                                color: kBodyColor,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            color: kCircleColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff000000).withOpacity(0.5),
                                  offset: Offset(
                                    0,
                                    30,
                                  ),
                                  blurRadius: 30.0)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15.09),
                              width: 17.83,
                              height: 19.99,
                              child: Icon(
                                FontAwesomeIcons.bell,
                                color: kPorfileColor,
                                size: 18,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 11.08),
                                width: 248,
                                height: 20,
                                child: Text(
                                  'Notification',
                                  style: kInfobodytextstyle,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16.33, bottom: 11),
                              width: 6.33,
                              height: 11.67,
                              child: Icon(
                                FontAwesomeIcons.angleRight,
                                color: kBodyColor,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            color: kCircleColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff000000).withOpacity(0.5),
                                  offset: Offset(
                                    0,
                                    30,
                                  ),
                                  blurRadius: 30.0)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15.09),
                              width: 17.83,
                              height: 19.99,
                              child: Icon(
                                FontAwesomeIcons.wallet,
                                color: kPorfileColor,
                                size: 18,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 11.08),
                                width: 248,
                                height: 20,
                                child: Text(
                                  'Live Sport',
                                  style: kInfobodytextstyle,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16.33, bottom: 11),
                              width: 6.33,
                              height: 11.67,
                              child: Icon(
                                FontAwesomeIcons.angleRight,
                                color: kBodyColor,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            color: kCircleColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff000000).withOpacity(0.5),
                                  offset: Offset(
                                    0,
                                    30,
                                  ),
                                  blurRadius: 30.0)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15.09),
                              width: 17.83,
                              height: 19.99,
                              child: Icon(
                                FontAwesomeIcons.wallet,
                                color: kPorfileColor,
                                size: 18,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 11.08),
                                width: 248,
                                height: 20,
                                child: Text(
                                  'About Us',
                                  style: kInfobodytextstyle,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16.33, bottom: 11),
                              width: 6.33,
                              height: 11.67,
                              child: Icon(
                                FontAwesomeIcons.angleRight,
                                color: kBodyColor,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            color: kCircleColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff000000).withOpacity(0.5),
                                  offset: Offset(
                                    0,
                                    30,
                                  ),
                                  blurRadius: 60.0)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15.09),
                              width: 17.83,
                              height: 19.99,
                              child: Icon(
                                FontAwesomeIcons.wallet,
                                color: kPorfileColor,
                                size: 18,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 11.08),
                                width: 248,
                                height: 20,
                                child: Text(
                                  'Contact Us',
                                  style: kInfobodytextstyle,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16.33, bottom: 11),
                              width: 6.33,
                              height: 11.67,
                              child: Icon(
                                FontAwesomeIcons.angleRight,
                                color: kBodyColor,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                        height: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            color: kCircleColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff000000).withOpacity(0.5),
                                  offset: Offset(
                                    0,
                                    30,
                                  ),
                                  blurRadius: 60.0)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15.09),
                              width: 17.83,
                              height: 19.99,
                              child: Icon(
                                FontAwesomeIcons.wallet,
                                color: kPorfileColor,
                                size: 18,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 11.08),
                                width: 248,
                                height: 20,
                                child: Text(
                                  'Terms & Privavcy Policy',
                                  style: kInfobodytextstyle,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16.33, bottom: 11),
                              width: 6.33,
                              height: 11.67,
                              child: Icon(
                                FontAwesomeIcons.angleRight,
                                color: kBodyColor,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 118,
            width: 328,
            margin: EdgeInsets.only(left: 24, right: 24, top: 125),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                color: kBackground,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff001847).withOpacity(0.12),
                      offset: Offset(0, -8),
                      blurRadius: 30.0)
                ]),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  height: 80,
                  child: Image.asset('assets/images/user.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      children: [
                        Text(
                          'Abiola Ogunjobi',
                          style: kNewheaderstyle,
                        ),
                        SizedBox(
                          width: 5.33,
                        ),
                        Image.asset('assets/images/verifyok.png')
                      ],
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Verified',
                      style: kverifytextstyle,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: ReuseableBottomBar(),
    );
    ;
  }
}