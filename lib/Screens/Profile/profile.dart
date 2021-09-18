import 'package:flutter/material.dart';
import 'package:meal_buddies/Screens/appbar_widget.dart';
import 'package:meal_buddies/UserPreferences.dart';
import 'package:meal_buddies/profile_widget.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          )
        ],
      ),
    );

  }
}