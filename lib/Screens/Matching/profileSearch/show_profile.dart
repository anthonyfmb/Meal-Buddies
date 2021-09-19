
import 'package:meal_buddies/Screens/Matching/profileSearch/chat_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_buddies/Screens/Matching/profileSearch/chat.dart';

// This page shows profile
class ShowProfile extends StatefulWidget{

  final String diningCourt;
  ShowProfile({required this.diningCourt});
  @override
  _ShowProfileState createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  List<ChatUsers> chatUsers = [
    ChatUsers(text: "Mitchell Daniela", secondaryText: "Politics, Soccer", image: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(text: "Jeff Bezos", secondaryText: "Basketball, Space", image: "images/userImage2.jpeg", time: "Now"),
    ChatUsers(text: "Sundar Pichai", secondaryText: "Entreprenurship, Cricket ", image: "images/userImage3.jpeg", time: "Now"),
    ChatUsers(text: "Tony Stark", secondaryText: "Movies, Science", image: "images/userImage4.jpeg", time: "Noe"),
    ChatUsers(text: "Thomas Jefferson", secondaryText: "History, Politics", image: "images/userImage5.jpeg", time: "in 5 min"),
    ChatUsers(text: "Tim Cook", secondaryText: "Design, Golf", image: "images/userImage6.jpeg", time: "in 3 min"),
    ChatUsers(text: "Morgan Freeman", secondaryText: "Baseball, Reading", image: "images/userImage7.jpeg", time: "in 10 min"),
    ChatUsers(text: "Joe Cooper", secondaryText: "Coding, Math", image: "images/userImage8.jpeg", time: "in 15 min"),
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
                return ChatUsersList(
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