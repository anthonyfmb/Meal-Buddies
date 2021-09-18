import 'package:flutter/material.dart';
import 'package:meal_buddies/Screens/Welcome/log_in.dart';

//Import Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';

import 'Screens/Welcome/sign_up.dart';

void main() {

  runApp(MyApp());
}




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

