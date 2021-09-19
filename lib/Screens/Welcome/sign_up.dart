import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_buddies/Screens/Matching/choose_court.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
Author: Anthony, David
Date: 9/18/2021
This class is responsible for Sign Up.

*/


class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Variables that save email, password,
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _interestsController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    // This container is responsible for Sign Up text
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text(
                      'Signup',
                      style:
                          TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    // This container is responsible for the period at the end of Sign Up Text
                    padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
            Container(
                // Responsible for Text Inputs
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _emailController,
                      // Textfield for email
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: _passwordController,
                      // Textfield for Password
                      decoration: InputDecoration(
                          
                          labelText: 'PASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: _firstNameController,
                      // Textfield for First Name
                      decoration: InputDecoration(
                          labelText: 'FIRST NAME ',
                          hintText: "Ex: John",
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w200,
                              color: Colors.grey),
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: _lastNameController,
                      // Textfield for Last Name
                      decoration: InputDecoration(
                          labelText: 'LAST NAME ',
                          hintText: "Ex: Smith",
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w200,
                              color: Colors.grey),
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: _majorController,
                      // Text field for major
                      decoration: InputDecoration(
                          labelText: 'MAJOR ',
                          hintText: "Ex: Computer Science",
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w200,
                              color: Colors.grey),
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: _yearController,
                      // Textfield for year of graduation
                      decoration: InputDecoration(
                          labelText: 'YEAR ',
                          hintText: "EX: 2025",
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w200,
                              color: Colors.grey),
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: _interestsController,
                      // Textfield for Interests
                      decoration: InputDecoration(
                          labelText: 'Interests ',
                          hintText: "EX: Coding",
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w200,
                              color: Colors.grey),
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: _genderController,
                      // Text field for gender
                      decoration: InputDecoration(
                          labelText: 'Gender ',
                          hintText: 'Ex: Female',
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w200,
                              color: Colors.grey),
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: _aboutController,
                      // Text field for gender
                      decoration: InputDecoration(
                          labelText: 'About ',
                          hintText: 'Ex: I like computers',
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w200,
                              color: Colors.grey),
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                        // Container that is responsible for the Sign up and go back button
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              _register();
                            },
                            child: Center(
                              child: Text(
                                'SIGNUP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Center(
                            child: Text('Go Back',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ]),
        ));
  }




void _register() async { // Responsible for sign up
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if(email != null) {
      try {
        final User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password)).user;
        setState(() {
          if (user != null) {
            CollectionReference users = FirebaseFirestore.instance.collection('users');

            users.add({ // adds the user through fields
              'id': users.id,
              'firstName': _firstNameController.text,
              'lastName': _lastNameController.text,
              'userEmail': _emailController.text,
              'photoUrl': "https://www.kindpng.com/picc/m/22-223965_no-profile-picture-icon-circle-member-icon-png.png",
              'major' : _majorController.text,
              'interests' : _interestsController.text,
              'gender' : _genderController.text,
              'about' : _aboutController.text,

            });

            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()),);
          }
        });
      } catch (e) {

      }
    }
    else{
    }
   }
  
}
