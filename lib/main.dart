import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meal_buddies/Screens/Welcome/log_in.dart';
import 'package:meal_buddies/Screens/Profile/profile.dart';

//Import Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'Screens/Welcome/sign_up.dart';
import 'Screens/Profile/edit_profile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

/*
Author: David, Anthony
Date: 9/18/2021
This class is responsible for being the main method of the whole project.

*/
//Stateful means it is dynamic
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState(); //creats instance of desired page
}

class _MyAppState extends State<MyApp> {
  //start of firebase initialization
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;
  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }
//end of firebase initalization
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => Signup()
      },
      home: Login(),
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
    );
  }
}

