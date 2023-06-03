// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unused_field, prefer_final_fields, body_might_complete_normally_nullable, unused_local_variable, file_names, non_constant_identifier_names, use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// My own package

import 'package:http/http.dart' as http;
import 'package:rhapsave/home.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:rhapsave/main.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rhapsave/scanner.dart';

// final navigatorKey = GlobalKey<NavigatorState>();

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // late SharedPreferences preferences;
  bool Loading = false;

  bool isLogedin = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  // For the first method that worked

  // static final Config config = Config(
  //   tenant: '6762e8f8-825b-400d-961f-f010c25b02f5',
  //   clientId: '906cfb22-37b0-47b1-a15c-3b42a60460e8',
  //   // '7800f2e3-11e8-4d1c-b525-673bb5fc6c22',
  //   // '906cfb22-37b0-47b1-a15c-3b42a60460e8',
  //   scope: 'openid profile offline_access User.read',
  //   // '906cfb22-37b0-47b1-a15c-3b42a60460e8 User.read',
  //   // 'openid profile offline_access User.read',
  //   navigatorKey: navigatorKey,
  //   redirectUri: "https://mobile.nubiaville.com",
  //   loader: Center(child: CircularProgressIndicator()),
  //   isB2C: false,
  //   domainHint: "consumer",
  // );

  // final AadOAuth oauth = AadOAuth(config);
  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  // void login(bool redirect) async {
  //   config.webUseRedirect = redirect;
  //   final secret = config.tenant;
  //   final result = await oauth.login();
  //   print('This is the result: ' '$result');
  //   print('this is the  secret: ' '$secret');
  //   // result.fold(
  //   //   (l) => showError(l.toString()),
  //   //   (r) => showMessage('Logged in successfully'),
  //   //   // your access token: $r'),
  //   // );
  //   if (secret.isNotEmpty) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Login Successfull')));
  //   } else{
  //      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Error')));
  //   }
  //   var accessToken = await oauth.getAccessToken();
  //   config.loginHint = email;
  //   var userId = config.loginHint;
  //   if (config.loginHint != null) {
  //     print(userId);
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  //     // ScaffoldMessenger.of(context)
  //     //     .showSnackBar(SnackBar(content: Text(accessToken)));
  //   } else {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  //     print('Error here');
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('error')));
  //   }
  // }

  void logout() async {
    await oauth.logout();
    showMessage('Logged out');
  }

// For second method
  static final Config config = Config(
    tenant: '6762e8f8-825b-400d-961f-f010c25b02f5',
    clientId: '906cfb22-37b0-47b1-a15c-3b42a60460e8',
    // '906cfb22-37b0-47b1-a15c-3b42a60460e8',
    // '7800f2e3-11e8-4d1c-b525-673bb5fc6c22',
    scope: 'openid profile email offline_access User.read',
    navigatorKey: navigatorKey,
    redirectUri: "https://mobile.nubiaville.com",
    loader: Center(child: CircularProgressIndicator()),
    isB2C: false,
    domainHint: "consumer",
  );
  final AadOAuth oauth = AadOAuth(config);

  Future<String?> signin({
    required String email,
  }) async {
    print('on our way');

    await oauth.login();

    print('Progress');

    // for email sending
    var response2 = await http
        .post(Uri.parse('https://mobile.nubiaville.com/sso/returnStatus'),
            body: jsonEncode({
              "email": email,
            }),
            headers: {
          // "Authorization": "Bearer",
          "Content-Type": "application/json",
        });

    var response =
        await http.get(Uri.parse('https://mobile.nubiaville.com'), headers: {
      // "Authorization": "Bearer",
      "Content-Type": "application/json",
    });

    // print(response.body);
    print(email);
    print('Converted response: ');
    // var data2 = jsonDecode(response2.body);
    // print(data2);
    // var code = jsonDecode(response2.statusCode.toString());
    // print(code);
    try {
      if (response.statusCode == 200) {
        print('checking Status');
        // var data = json.decode(response.body);
        // print(data);

        var data2 = jsonDecode(response2.body);
        print(data2);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Home()));
        print('yessssssssssssss');

        if (data2['statuscode'] == 200) {
          print('Ok Good To Go');

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignIn()));
          print('Paul try again');
        }
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      }
    } catch (e) {
      print(e);
    }

    //   try{
    //   print('almost there ');

    //   // print(response.body);
    //   switch (response.statusCode) {
    //     case HttpStatus.ok:
    //       if (response.statusCode != 200) {
    //         // var data = jsonDecode(response.body);
    //         // print(data);
    //         // await sharedPreferences.setString('token', accessToken);
    //         Navigator.push(
    //             context, MaterialPageRoute(builder: (context) => Home()));
    //       }
    //     // if (accessToken != null) {
    //     //   await sharedPreferences.setString('token', accessToken);
    //     //   Navigator.push(
    //     //       context, MaterialPageRoute(builder: (context) => Home()));
    //     // }
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  //***************************** */ Third Method

  // static const String TENANT_ID = '6762e8f8-825b-400d-961f-f010c25b02f5';
  // static const String CLIENT_ID = '7800f2e3-11e8-4d1c-b525-673bb5fc6c22';
  // // '906cfb22-37b0-47b1-a15c-3b42a60460e8';

  // late Config config;
  // late AadOAuth oauth = AadOAuth(config);
  // @override
  // initState() {
  //   Object redirectUri;
  //   late String scope;
  //   late String responseType;
  //   late String loader;
  //   late String isB2C;
  //   late String domainHint;

  //   scope = 'openid profile email online_access User.read';
  //   // redirectUri = "https://mobile.nubiaville.com";
  //   // "https://mobile.nubiaville.com/application/third_party/simplesaml/www/module.php/core/authenticate.php?as=default-sp";
  //   // "https://mobile.nubiaville.com/application/third_party/simplesaml/www/module.php/core/authenticate.php";
  //   // "https://login.microsoftonline.com/common/oauth2/nativeclient";
  //   // "https://mobile.nubiaville.com";

  //   config = Config(
  //       tenant: TENANT_ID,
  //       clientId: CLIENT_ID,
  //       scope: scope,
  //       navigatorKey: navigatorKey,
  //       // redirectUri: '$redirectUri',
  //       loader: Center(child: CircularProgressIndicator()),
  //       isB2C: false,
  //       domainHint: "consumer");

  //   oauth = AadOAuth(config);
  //   final tenantId = config.tenant;
  //   // oauth..setContext(context);
  //   // checkIsLogged();
  //   // checkIsNotLogged();
  //   super.initState();
  // }

  // void showError(dynamic ex) {
  //   showMessage(ex.toString());
  // }

  // void showMessage(String text) {
  //   var alert = AlertDialog(
  //       content: Container(child: Text(text)),
  //       icon: Icon(Icons.logout_rounded),
  //       actions: <Widget>[
  //         ElevatedButton(
  //             child: const Text('Ok'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             })
  //       ]);
  //   showDialog(context: context, builder: (BuildContext context) => alert);
  // }

  // // void checkIsLogged() async {
  // //   String? accessToken = await oauth.getAccessToken();
  // //   String? idToken = await oauth.getIdToken();
  // //   final tenantId = config.tenant;
  // //   if (TENANT_ID == tenantId) {
  // //     print(TENANT_ID);
  // //     Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  // //   } else {
  // //     // Navigator.push(
  // //     //     context, MaterialPageRoute(builder: (context) => SignIn()));
  // //     Navigator.pop(context);
  // //     showMessage('Error');
  // //   }
  // // }

  // // void checkIsNotLogged() async {
  // //   if (await oauth.getIdToken() == null) {
  // //     // String? accessToken = await oauth.getAccessToken();
  // //     showMessage(' Your are Logged Out. \n Please Login again');
  // //   }
  // // }

  // // void login(bool redirect) async {
  // //   // config.webUseRedirect = redirect;
  // //   final result = await oauth.login();
  // //   result.fold(
  // //     (l) => showError(l.toString()),
  // //     (r) => showMessage('Logged in successfully, your access token: $r'),
  // //   );
  // //   var accessToken = await oauth.getAccessToken();
  // //   if (accessToken != null) {
  // //     ScaffoldMessenger.of(context)
  // //         .showSnackBar(SnackBar(content: Text(accessToken)));
  // //   }
  // // }

  // // void login() async {
  // //   try {
  // //     // SharedPreferences sharedPreferences =
  // //     //     await SharedPreferences.getInstance();
  // //     await oauth.login();
  // //     String? accessToken = await oauth.getIdToken();
  // //     // String? idToken = await oauth.getIdToken();
  // //     // final tenantId = config.tenant;
  // //     // final email = config.loginHint;
  // //     // print(tenantId);
  // //     // print(TENANT_ID);
  // //     // print(config.clientId);
  // //     // print(config.domainHint);
  // //     // print(email);
  // //     // print(config.authorizationUrl);
  // //     // print(config.origin);
  // //     // print(config.state);
  // //     // print(config.tokenIdentifier);
  // //     // print(config.tokenUrl);
  // //     // print(config.webUseRedirect);
  // //     // print(config.userAgent);
  // //     print('Tis is the token :  $accessToken');
  // //     if (accessToken != null) {

  // //     print(accessToken);
  // Navigator.push(
  //     context, MaterialPageRoute(builder: (context) => Home()));
  // //       showMessage('Login Successfully');
  // //     } else if (accessToken == null) {
  // //       Navigator.push(
  // //           context, MaterialPageRoute(builder: (context) => SignIn()));
  // //       // Navigator.pop(context);
  // //       print('Error');
  // //       showMessage('Login Unsuccessfully');
  // //     }
  // //   } catch (e) {
  // //     showError(e);
  // //   }
  // // }

  // void logout() async {
  //   await oauth.logout();
  //   showMessage('Logout ?');
  // }

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

  // late final LocalAuthentication auth;
  // bool _supportState = false;

  //function to get available thumbprint
  // Future<void> _getAvailableBiometrics() async {
  //   List<BiometricType> availableBiometrics =
  //       await auth.getAvailableBiometrics();
  //   if (!mounted) {
  //     return;
  //   }
  // }

  // //function to authenticate using finger print
  // Future<void> _authenticate() async {
  //   try {
  //     bool authenticated = await auth.authenticate(
  //       localizedReason: 'localizedReason',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //         biometricOnly: true,
  //       ),
  //     );
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  // }

  // second code
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  // Future<void> _checkBiometrics() async {
  //   late bool canCheckBiometrics;
  //   try {
  //     canCheckBiometrics = await auth.canCheckBiometrics;
  //   } on PlatformException catch (e) {
  //     canCheckBiometrics = false;
  //     print(e);
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   setState(() {
  //     _canCheckBiometrics = canCheckBiometrics;
  //   });
  // }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Scanner()));
      });
      authenticated = await auth.authenticate(
        localizedReason: 'SignIn with FingerPrint',
        options:
            const AuthenticationOptions(stickyAuth: true, biometricOnly: false,),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  // Future<void> _authenticateWithBiometrics() async {
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //       localizedReason:
  //           'Scan your fingerprint (or face or whatever) to authenticate',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //         biometricOnly: true,
  //       ),
  //     );
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Authenticating';
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Error - ${e.message}';
  //     });
  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   final String message = authenticated ? 'Authorized' : 'Not Authorized';
  //   setState(() {
  //     _authorized = message;
  //   });
  // }

  // Future<void> _cancelAuthentication() async {
  //   await auth.stopAuthentication();
  //   setState(() => _isAuthenticating = false);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   auth = LocalAuthentication();
  //   auth.isDeviceSupported().then((bool isSupported) {
  //     setState(() {
  //       _supportState = isSupported;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 0.5),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: ListView(
                      children: [
                        // To show the title of the app

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                          child: Text(
                            'Finger print Login',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                        ),

                        Divider(
                          color: Colors.orange,
                          height: 20.0,
                          thickness: 5.0,
                        ),

                        //Request for Username
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 40.0),
                          child: Text(
                            'Email',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(30.0, 10.0, 40.0, 0.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white.withOpacity(0.5),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 2),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.white,
                                    // Theme.of(context).primaryColor,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              validator: (val) {
                                return val!.isEmpty
                                    ? "Email can not be empty"
                                    : null;
                              },
                            ),
                          ),
                        ),

                        //Signin Button
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Login Button
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  30.0, 30.0, 30.0, 10.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Color.fromARGB(255, 20, 118, 197)
                                    .withOpacity(1.0),
                                elevation: 10.0,
                                child: MaterialButton(
                                  onPressed: _getAvailableBiometrics,
                                  // ()async {
                                  // if (_formKey.currentState!.validate()) {
                                  //   signin(
                                  //     email: _emailTextController.text,
                                  //   );
                                  // },},
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: const Text(
                                    "Login",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Finger Print Button
                            IconButton(
                              onPressed: _authenticate,
                              icon: Icon(Icons.fingerprint_sharp,
                                  size: 45, color: Colors.blue),
                            )
                          ],
                        ),

                        //SignOut
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              30.0, 30.0, 200.0, 30.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color.fromARGB(255, 20, 118, 197)
                                .withOpacity(1.0),
                            elevation: 10.0,
                            child: MaterialButton(
                              onPressed: () async {
                                logout();
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: const Text(
                                "Logout",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      //******* */
      // Scaffold(
      //   body: Container(
      //     margin: EdgeInsets.only(top: 225, left: 25),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: <Widget>[
      //         Text(
      //           'AzureAD SSO OAuth Sample',
      //           style: TextStyle(fontSize: 18),
      //         ),

      //         // Login
      //         // if (kIsWeb)
      //         Padding(
      //           padding: const EdgeInsets.fromLTRB(0, 30.0, 30.0, 30.0),
      //           child: Material(
      //             borderRadius: BorderRadius.circular(5.0),
      //             color: Color.fromARGB(255, 20, 118, 197).withOpacity(1.0),
      //             elevation: 10.0,
      //             child: MaterialButton(
      //               onPressed: () {
      //                 // login(true);
      //                 // login();
      //                 signin(
      //                     email: _emailTextController.text,
      //                     password: _passwordTextController.text);
      //                 // var token = await signIn();
      //                 // if (token != null) {
      //                 //   Navigator.push(context,
      //                 //       MaterialPageRoute(builder: (context) => Home()));
      //                 // }

      //                 print(' This is true 00');
      //               },
      //               minWidth: MediaQuery.of(context).size.width,
      //               child: const Text(
      //                 "SSO Login",
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 20.0,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),

      //         //Logout
      //         Padding(
      //           padding: const EdgeInsets.fromLTRB(0, 30.0, 30.0, 30.0),
      //           child: Material(
      //             borderRadius: BorderRadius.circular(5.0),
      //             color: Color.fromARGB(255, 20, 118, 197).withOpacity(1.0),
      //             elevation: 10.0,
      //             child: MaterialButton(
      //               onPressed: () {
      //                 logout();
      //                 // Navigator.push(context,
      //                 //     MaterialPageRoute(builder: (context) => Home()));
      //               },
      //               minWidth: MediaQuery.of(context).size.width,
      //               child: const Text(
      //                 "SSO Logout",
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 20.0,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

// First working method
// Scaffold(
//         body: Container(
//           margin: EdgeInsets.only(top: 225, left: 25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[

//               Text('AzureAD SSO OAuth Sample', style: TextStyle(fontSize: 18),),

//               // Login
//                Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 30.0, 30.0, 30.0),
//                 child: Material(
//                   borderRadius: BorderRadius.circular(5.0),
//                   color: Color.fromARGB(255, 20, 118, 197).withOpacity(1.0),
//                   elevation: 10.0,
//                   child: MaterialButton(
//                     onPressed: () {
//                       login(true);

//                       print(' This is true');
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Home()));
//                     },
//                     minWidth: MediaQuery.of(context).size.width,
//                     child: const Text(
//                       "SSO Login",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               if (kIsWeb)
//                 ListTile(
//                   leading: Icon(Icons.launch, color: Colors.blue),
//                   title: Text('Login (web redirect)',
//                       style: TextStyle(color: Colors.blue)),
//                   onTap: () {
//                     login(true);

//                     print(' This is true');
//                     Navigator.push(
//                         context, MaterialPageRoute(builder: (context) => Home()));
//                   },
//                 ),

//               //Logout
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 30.0, 30.0, 30.0),
//                 child: Material(
//                   borderRadius: BorderRadius.circular(5.0),
//                   color: Color.fromARGB(255, 20, 118, 197).withOpacity(1.0),
//                   elevation: 10.0,
//                   child: MaterialButton(
//                     onPressed: () {
//                       logout();
//                       // Navigator.push(context,
//                       //     MaterialPageRoute(builder: (context) => Home()));
//                     },
//                     minWidth: MediaQuery.of(context).size.width,
//                     child: const Text(
//                       "SSO Logout",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//Second method
// Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               color: Colors.white,
//               margin: EdgeInsets.only(top: 0.5),
//               child: Center(
//                 child: Form(
//                   key: _formKey,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 90.0),
//                     child: ListView(
//                       children: [
//                         // To show the title of the app

//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
//                           child: Text(
//                             'Azure Login',
//                             style: TextStyle(
//                                 color: Colors.orange,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 28),
//                           ),
//                         ),

//                         Divider(
//                           color: Colors.orange,
//                           height: 20.0,
//                           thickness: 5.0,
//                         ),

//                         //Request for Username
//                         Padding(
//                           padding: const EdgeInsets.only(left: 30.0, top: 40.0),
//                           child: Text(
//                             'Email',
//                             style: TextStyle(
//                                 color: Colors.orange,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),

//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(30.0, 10.0, 40.0, 0.0),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(5.0),
//                             color: Colors.grey.withOpacity(0.5),
//                             child: TextFormField(
//                               controller: _emailTextController,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.only(top: 2),
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     style: BorderStyle.solid,
//                                     color: Colors.white,
//                                     // Theme.of(context).primaryColor,
//                                     width: 2.0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),

//                         // Password
//                         Padding(
//                           padding: const EdgeInsets.only(left: 30.0, top: 20.0),
//                           child: Text(
//                             'Password',
//                             style: TextStyle(
//                                 color: Colors.orange,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),

//                         //Password
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(30.0, 10.0, 40.0, 0.0),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(5.0),
//                             color: Colors.grey.withOpacity(0.5),
//                             child: TextFormField(
//                               controller: _passwordTextController,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.only(top: 2),
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     style: BorderStyle.solid,
//                                     color: Colors.white,
//                                     // Theme.of(context).primaryColor,
//                                     width: 2.0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),

//                         //Signin Button
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(
//                               30.0, 30.0, 200.0, 30.0),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(5.0),
//                             color: Color.fromARGB(255, 20, 118, 197)
//                                 .withOpacity(1.0),
//                             elevation: 10.0,
//                             child: MaterialButton(
//                               onPressed: () async {
//                                 // signIn(
//                                   email: _emailTextController.text,
//                                   password: _passwordTextController.text,
//                                 // );
//                                 login(true);
//                                 // Navigator.push(
//                                 //     context,
//                                 //     MaterialPageRoute(
//                                 //         builder: (context) => Home()));
//                               },
//                               minWidth: MediaQuery.of(context).size.width,
//                               child: const Text(
//                                 "Login",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.0,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),

//                         //SignOut
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(
//                               30.0, 30.0, 200.0, 30.0),
//                           child: Material(
//                             borderRadius: BorderRadius.circular(5.0),
//                             color: Color.fromARGB(255, 20, 118, 197)
//                                 .withOpacity(1.0),
//                             elevation: 10.0,
//                             child: MaterialButton(
//                               onPressed: () async {
//                                 logout();
//                               },
//                               minWidth: MediaQuery.of(context).size.width,
//                               child: const Text(
//                                 "Logout",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.0,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
