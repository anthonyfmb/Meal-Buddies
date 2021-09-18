import 'package:flutter/material.dart';
import 'package:meal_buddies/Screens/Welcome/log_in.dart';
import 'package:meal_buddies/Screens/Profile/profile.dart';

//Import Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'Screens/Welcome/sign_up.dart';


void main() {
  runApp(MyApp());
}

/*
Author: David, Anthony
Date: 9/18/2021
This class is responsible for being the main method of the whole project.

*/



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => Signup()
      },
      home: Login(),
    );
  }
}

