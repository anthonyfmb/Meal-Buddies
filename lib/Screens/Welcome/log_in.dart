import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meal_buddies/Authentication/Helpers/database_methods.dart';
import 'package:meal_buddies/Authentication/Helpers/helper_functions.dart';
import 'package:meal_buddies/Screens/Matching/choose_court.dart';
import 'package:meal_buddies/Screens/Welcome/forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
Author: David, Anthony
Date: 9/18/2021
This class is responsible for loggin in.

*/

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  _signInWithEmailAndPassword() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
      );

      QuerySnapshot userInfoSnapshot = await DatabaseMethods().getUserInfo(_emailController.text);

      // Saves userName, email, and Document ID
      //
      // HelperFunctions.saveUserLoggedInSharedPreference(true);
      // HelperFunctions.saveUserEmailSharedPreference(_emailController.text);
      //



      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => HomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _passwordController.clear();
        AlertDialog inUse = AlertDialog(
          title: Text("User not found"),
          content: Text("Please try again."),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        );

        // show the dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return inUse;
          },
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _passwordController.clear();

        AlertDialog inUse = AlertDialog(
          title: Text("Wrong Password"),
          content: Text("Please try again."),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        );

        // show the dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return inUse;
          },
        );
        print('Wrong password provided for that user.');
      }
    }
    //   final User? user = (await _firebaseAuth.signInWithEmailAndPassword(
    //       email: _emailController.text, password: _passwordController.text)).user;
    //
    //   if(user!= null){
    //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);
    //
    //   } else {
    //   AlertDialog inUse = AlertDialog(
    //     title: Text("Wrong Credentials"),
    //     content: Text("Please try again."),
    //     shape:
    //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //   );
    //
    //   // show the dialog
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return inUse;
    //     },
    //   );
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          Container(
            // This container is responsible for Hello There
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text('Hello',
                      style:
                          TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  child: Text('There',
                      style:
                          TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                )
              ],
            ),
          ),
          Container(
              // This container is responsible for Email, Password TextBox and design
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPassword()),
                        );
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          _signInWithEmailAndPassword();

                        },
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              )),
          SizedBox(height: 15.0),
          Row(
            // This Row is responsible for register button, and asking a question if they are new
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'New to MealBuddies?',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
      ],
    ),
        ));
  }


}
