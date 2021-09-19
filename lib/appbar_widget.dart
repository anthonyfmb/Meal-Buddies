import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Screens/Matching/choose_court.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.arrow_right;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.blue,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(icon),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
      )
    ]
  );
}