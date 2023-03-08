import 'package:email_for_blind/pages/googl_login.dart';
import 'package:email_for_blind/pages/home.dart';
import 'package:email_for_blind/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class AuthApp extends StatefulWidget {
  @override
  _AuthAppState createState() => _AuthAppState();
}

class _AuthAppState extends State<AuthApp> {
  LocalAuthentication auth = LocalAuthentication();
  late bool _canCheckBiometric;
  late List<BiometricType> _availableBiometric;
  String authorized = "Not authorized";

  //checking bimetrics
  //this function will check the sensors and will tell us
  // if we can use them or not
  Future<void> _checkBiometric() async {
    late bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  //this function will get all the available biometrics inside our device
  //it will return a list of objects, but for our example it will only
  //return the fingerprint biometric
  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  //this function will open an authentication dialog
  // and it will check if we are authenticated or not
  // so we will add the major action here like moving to another activity
  // or just display a text that will tell us that we are authenticated
  Future<void> _authenticate() async {
    var isUserLoggedIn =
        await GoogleSignIn(scopes: ['https://mail.google.com/']).isSignedIn();
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason: "Scan your finger print to authenticate",
          options: const AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
          ));
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      authorized =
          authenticated ? "Autherized success" : "Failed to authenticate";
      if (authenticated) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => GoogleLoginPage()));
        if (isUserLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => homepage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => GoogleLoginPage()));
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkBiometric();
    _getAvailableBiometrics();
    _authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/fingerprint.png',
                      width: 220,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Fingerprint Authentication',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Authenticate using FingerPrint For Safty",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        )),
                  ],
                ),
              ),
              //  Center(
              //  child: //ElevatedButton(
              //onPressed:
              // _authenticate;
              //,
              //child: Text(
              // "Get Authentication",
              // style: TextStyle(
              //   color: Colors.black,
              //   fontSize: 20,
              //  fontWeight: FontWeight.bold),
              // ),
              // ),
              // ),

              // Text("Can check biometric: $_canCheckBiometric"),
              //  Text("Available biometric: $_availableBiometric"),
              //  Text("Current State: $authorized"),
            ],
          ),
        ),
      ),
    );
  }
}
