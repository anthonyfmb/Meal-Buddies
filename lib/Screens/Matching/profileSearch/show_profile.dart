
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
    ChatUsers(text: "Mitch Daniels", secondaryText: "Politics, Soccer", image: "https://www.purdue.edu/president/documents/Headshot.jpg", time: "Now"),
    ChatUsers(text: "Jeff Bezos", secondaryText: "Basketball, Space", image: "https://i.pinimg.com/originals/69/cf/88/69cf8839c8c18044a4e5c0506e12266b.jpg", time: "Now"),
    ChatUsers(text: "Sundar Pichai", secondaryText: "Entreprenurship, Cricket ", image: "https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg", time: "Now"),
    ChatUsers(text: "Tony Stark", secondaryText: "Movies, Science", image: "https://www.teahub.io/photos/full/172-1725465_tony-stark-without-beard.jpg", time: "Now"),
    ChatUsers(text: "Thomas Jefferson", secondaryText: "History, Politics", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/02_Thomas_Jefferson_3x4.jpg/576px-02_Thomas_Jefferson_3x4.jpg", time: "in 5 min"),
    ChatUsers(text: "Tim Cook", secondaryText: "Design, Golf", image: "https://news-media.stanford.edu/wp-content/uploads/2019/02/21104538/cook_hz.jpg", time: "in 3 min"),
    ChatUsers(text: "Morgan Freeman", secondaryText: "Baseball, Reading", image: "https://i.pinimg.com/originals/fe/8f/59/fe8f592aad933bb5c1a2c7b3baa047e9.jpg", time: "in 15 min"),
    ChatUsers(text: "Joe Cooper", secondaryText: "Coding, Math", image: "https://pga-tour-res.cloudinary.com/image/upload/c_fill,d_headshots_default.png,dpr_3.0,f_auto,g_face:center,h_350,q_auto,w_280/headshots_35281.png", time: "in 15 min"),

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
                        color: Colors.grey.shade100,
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