import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/*
  Name: David, Anthony, Eric, Rishee
  Date: 9/19/2021
  This class help with app bar.
 */

AppBar buildAppBar(BuildContext context) {

  final icon = CupertinoIcons.arrow_right;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.blue,
    elevation: 0,
  );
}