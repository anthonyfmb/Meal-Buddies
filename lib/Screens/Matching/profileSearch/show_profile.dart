
import 'package:meal_buddies/Screens/Matching/profileSearch/profile_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_buddies/Screens/Matching/profileSearch/profile_list.dart';

/*
  Name: David, Anthony, Eric, Rishee
  Date: 9/19/2021
  This page shows the profile of all people available for meal.
 */

class ShowProfile extends StatefulWidget{

  final String diningCourt;
  ShowProfile({required this.diningCourt});
  @override
  _ShowProfileState createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  List<ProfileUsers> chatUsers = [
    ProfileUsers(text: "Jane Russel", secondaryText: "Awesome Setup", image: "images/userImage1.jpeg", time: "Now"),
    ProfileUsers(text: "Glady's Murphy", secondaryText: "That's Great", image: "images/userImage2.jpeg", time: "Yesterday"),
    ProfileUsers(text: "Jorge Henry", secondaryText: "Hey where are you?", image: "images/userImage3.jpeg", time: "31 Mar"),
    ProfileUsers(text: "Philip Fox", secondaryText: "Busy! Call me in 20 mins", image: "images/userImage4.jpeg", time: "28 Mar"),
    ProfileUsers(text: "Debra Hawkins", secondaryText: "Thankyou, It's awesome", image: "images/userImage5.jpeg", time: "23 Mar"),
    ProfileUsers(text: "Jacob Pena", secondaryText: "will update you in evening", image: "images/userImage6.jpeg", time: "17 Mar"),
    ProfileUsers(text: "Andrey Jones", secondaryText: "Can you please share the file?", image: "images/userImage7.jpeg", time: "24 Feb"),
    ProfileUsers(text: "John Wick", secondaryText: "How are you?", image: "images/userImage8.jpeg", time: "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.diningCourt,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ProfileUsersList(
                  text: chatUsers[index].text,
                  secondaryText: chatUsers[index].secondaryText,
                  image: chatUsers[index].image,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}