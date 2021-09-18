import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                    alignment: Alignment.center,
                    child: Text('PROFILE',
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
                    child: Text('Hey, USER',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Text(
                  'Username: ',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                // child: Column(
                //   children: <Widget>[
                //     TextField(
                //       decoration: InputDecoration(
                //           labelText: 'EMAIL',
                //           labelStyle: TextStyle(
                //               fontFamily: 'Montserrat',
                //               fontWeight: FontWeight.bold,
                //               color: Colors.grey),
                //           focusedBorder: UnderlineInputBorder(
                //               borderSide: BorderSide(color: Colors.green))),
                //     ),
                //     SizedBox(height: 40.0),
                //     Container(
                //       height: 40.0,
                //       child: Material(
                //         borderRadius: BorderRadius.circular(20.0),
                //         shadowColor: Colors.greenAccent,
                //         color: Colors.green,
                //         elevation: 7.0,
                //         child: GestureDetector(
                //           onTap: () {},
                //           child: Center(
                //             child: Text(
                //               'CHANGE EMAIL',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold,
                //                   fontFamily: 'Montserrat'),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(height: 20.0),
                //   ],
                // )
            ),
            SizedBox(height: 15.0),
            Row(
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
        ));
  }
}