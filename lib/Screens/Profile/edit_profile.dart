import 'package:flutter/material.dart';
import 'package:meal_buddies/user.dart';
import 'package:meal_buddies/UserPreferences.dart';
import 'package:meal_buddies/appbar_widget.dart';
import 'package:meal_buddies/profile_widget.dart';
import 'package:meal_buddies/textfield_widget.dart';
import 'package:meal_buddies/button_widget.dart';
import 'package:meal_buddies/Screens/Profile/profile.dart';

/*
  Name: David, Anthony, Eric, Rishee
  Date: 9/19/2021
  This class help with editing profile.
 */


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 32),
      physics: BouncingScrollPhysics(),
      children: [
        ProfileWidget(
          imagePath: user.imagePath,
          isEdit: true,
          onClicked: () async {}
        ),
        const SizedBox(height: 24),
        buildButton(),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'Full Name',
          text: user.name,
          onChanged: (name) {}, // constantly refreshes
        ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'Email',
          text: user.email,
          onChanged: (email) {
            user = UserPreferences.myUser;
          }, // constantly refreshes
        ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'Password',
          text: user.password,
          onChanged: (password) {}, // constantly refreshes
        ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'About',
          text: user.about,
          maxLines: 5,
          onChanged: (about) {}, // constantly refreshes
        ),
      ],
    ),
  );

  Widget buildButton() => ButtonWidget(
    text: "Done",
    onClicked: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Profile()),
      );
    },
  );
}