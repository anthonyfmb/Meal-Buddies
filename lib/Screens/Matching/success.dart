import 'package:flutter/material.dart';
import 'package:meal_buddies/appbar_widget.dart';
import 'package:meal_buddies/UserPreferences.dart';
import 'package:meal_buddies/profile_widget.dart';
import 'package:meal_buddies/user.dart';
import 'package:meal_buddies/Screens/Profile/edit_profile.dart';
import 'package:meal_buddies/textfield_widget.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => new _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: buildAppBar(context),
      body: ListView(
        children: [
          const SizedBox(height: 100),
          Text(
            'Success!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Text(
            'You have matched with Mitch Daniels!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black),

          ),
        ],
      ),
    );
  }
}