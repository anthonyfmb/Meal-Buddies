import 'package:flutter/material.dart';

/*
Author: David, Anthony
Date: 9/18/2021
This class is responsible for matching page.

*/
class MatchingPage extends StatefulWidget {
  const MatchingPage({ Key? key }) : super(key: key);

  @override
  _MatchingPageState createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("This is matching page", textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}