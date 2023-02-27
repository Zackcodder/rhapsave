// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:rhapsave/home.dart';
// My OWn Package
import 'package:rhapsave/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // bool exist = sharedPreferences.containsKey('autoLogin') && sharedPreferences.containsKey('token');
  // bool autoLogin = exist ? sharedPreferences.getBool('autoLogin')! : false;
  runApp(MyApp());
// autoLogin
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // final bool autoLogin;
  //this.autoLogin,
  const MyApp( {Key? key}) : super(key: key);

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
      home: SignIn(),
      // !autoLogin ? SignIn() : Home(),
      // SignIn(),

      // Authenticate(),
      // SignIn(),
      navigatorKey: navigatorKey,
    );
  }
}

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  late final String? token;

  @override
  @override
  void initState() {
    super.initState();
    token = '';
  }

  @override
  Widget build(BuildContext context) {
    if (token != null) {
      if (token!.isNotEmpty) {
        print('Working');
        print(token);
        return Home();
      } else {
        return SignIn();
      }
    }
    return Container(
      color: Colors.blue,
    );
  }
}
