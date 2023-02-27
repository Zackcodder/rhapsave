// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rhapsave/constants/colors.dart';
// import 'package:rhapsave/constants/text_style.dart';
import 'package:rhapsave/reuseable_bottom_navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<bool> onBackButtonPressed(BuildContext context) async {
    bool? exitApp = await showDialog(
      context: context,
      builder: ((BuildContext context) {
        return AlertDialog(
          title: Text('Exist App'),
          content: Text('Do you want to Exit app ?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('No')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Yes')),
          ],
        );
      }),
    );
    return exitApp ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: Scaffold(
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
              height: 148,
              margin: EdgeInsets.only(left: 24, right: 24, top: 40),
              decoration: BoxDecoration(color: kCircleColor, boxShadow: [
                BoxShadow(
                    color: Color(0xff000000).withOpacity(0.05),
                    offset: Offset(
                      0,
                      30,
                    ),
                    blurRadius: 60.0)
              ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15, top: 20, right: 10),
                          height: 80,
                          width: 178,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Container(
                                height: 18,
                                child: Text(
                                  'Rhapsave saving',
                                  style: TextStyle(
                                      color: kCardheadertextColor,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              Container(
                                height: 30,
                                child: Text(
                                  'N 1,000,000',
                                  style: TextStyle(
                                      color: kCardheadertextColor,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Poppins',
                                      fontSize: 24.0,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 13,
                                  child: Text(
                                    'Save automatically towards a several goals.',
                                    style: TextStyle(
                                        color: kNavibuttonColor,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 15),
                        height: 80,
                        width: 80,
                        child: Image.asset('assets/images/pie.png'),
                      )
                    ],
                  ),
                  Container(
                    // color: kBodyColor,
                    margin: EdgeInsets.only(left: 15, right: 10, top: 10),
                    height: 12,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 12,
                          width: 60,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor: Color(0xffFFB531),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Car Saving',
                                style: TextStyle(
                                    color: kNavibuttonColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    fontSize: 8.0,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                        
                        
                        Container(
                          height: 12,
                          // width: 70,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor: Color(0xffFF9D78),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Mortage Savings',
                                style: TextStyle(
                                    color: kNavibuttonColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    fontSize: 8.0,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                        
                        
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 12,
                          width: 60,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor: Color(0xffF64F00),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'School Fees ',
                                style: TextStyle(
                                    color: kNavibuttonColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    fontSize: 8.0,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 12,
                          // width: 72,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor: Color(0xffFFB531),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Christmas Savings',
                                style: TextStyle(
                                    color: kNavibuttonColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    fontSize: 8.0,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        )
                      
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 45, right: 35, top: 10),
                    height: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 12,
                          width: 60,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor: Color(0xffFFB531),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Car Saving',
                                style: TextStyle(
                                    color: kNavibuttonColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    fontSize: 8.0,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                        
                        Container(
                          height: 12,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor: Color(0xffFF9D78),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Mortage Savings',
                                style: TextStyle(
                                    color: kNavibuttonColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    fontSize: 8.0,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                       
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 12,
                          width: 60,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor: Color(0xffF64F00) ,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'School Fees ',
                                style: TextStyle(
                                    color: kNavibuttonColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    fontSize: 8.0,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ReuseableBottomBar(),
      ),
    );
  }
}
