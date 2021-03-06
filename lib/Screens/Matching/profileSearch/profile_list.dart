
import 'package:flutter/material.dart';

/*
  Name: David, Anthony, Eric, Rishee
  Date: 9/19/2021
  This class helps with filling out data of people in a list.
 */


class ProfileUsersList extends StatefulWidget{
  String text;
  String secondaryText;
  String image;
  String time;
  bool isMessageRead;
  ProfileUsersList({required this.text,required this.secondaryText,required this.image,required this.time,required this.isMessageRead});
  @override
  _ProfileUsersListState createState() => _ProfileUsersListState();
}

class _ProfileUsersListState extends State<ProfileUsersList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.image),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.text),
                          SizedBox(height: 6),
                          Text(widget.secondaryText,style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.time,style: TextStyle(fontSize: 12,color: widget.isMessageRead?Colors.pink:Colors.grey.shade500),),
          ],
        ),
      ),
    );
  }
}