import 'package:flutter/material.dart';

/*
  Name: David, Anthony, Eric, Rishee
  Date: 9/19/2021
  This class help with constants.
 */

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0XFFF1E6FF);

class Constants{
  static String name = "";
  static String id = "";
  static String email = "";
  static String major = "";
  static String interests = "";
  static String myProfileImg = "";
  static const String Delete = 'Delete Chat';
  static const String Settings = 'Change Chat Name';


  static const List<String> choices = <String>[
    Delete,
    Settings,
  ];
}