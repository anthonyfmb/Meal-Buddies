import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_buddies/Authentication/Helpers/database_methods.dart';
import 'package:meal_buddies/Authentication/Helpers/helper_functions.dart';
import 'package:meal_buddies/Screens/Matching/profileSearch/show_profile.dart';
import 'package:meal_buddies/Screens/Profile/profile.dart';
import 'package:meal_buddies/constants.dart';

/*
  This class is responsible for picking place to eat
*/

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _borderRadius = 24;

  var items = [ // Hard coded data of Dining COurts
    PlaceInfo(
        '      Earhart Dining Court',
        Color(0xff6DC8F3),
        Color(0xff73A1F9),
        4.2,
        'Earhart',
        '',
        "https://api.hfs.purdue.edu/Menus/v2/file/2a70c68f-560b-49f7-8838-c695f92bd9bc"),
    PlaceInfo(
        '      Ford Dining Court',
        Color(0xffFFB157),
        Color(0xffFFA057),
        3.8,
        'Ford',
        '',
        "https://api.hfs.purdue.edu/Menus/v2/file/b8b7e146-37e3-4a4a-a0de-46d189fe1f87"),
    PlaceInfo(
        '      Hillenbrand Dining Court',
        Color(0xffFF5B95),
        Color(0xffF8556D),
        4.1,
        'HillenBrand',
        ' ',
        "https://api.hfs.purdue.edu/Menus/v2/file/3c068582-1710-4ef0-ab2c-ffcbdf6cc31c"),
    PlaceInfo(
        '      Wiley Dining Court',
        Color(0xffD76EF5),
        Color(0xff8F7AFE),
        4.7,
        'Wiley',
        '',
        "https://api.hfs.purdue.edu/Menus/v2/file/36dd94f8-ce14-490c-bd19-6059c374a92a"),
    PlaceInfo(
        '      Winsdor Dining Court',
        Color(0xff42E695),
        Color(0xff3BB2B8),
        4.2,
        'Winsdor',
        '',
        "https://api.hfs.purdue.edu/Menus/v2/file/5dc3c3df-9b7f-475a-94a6-e8f3d63bede3"),
  ];

  final icon = CupertinoIcons.arrow_right;
  AppBar buildAppBar() {
    // App bar
    return AppBar(
      
      // On Android by default its false
      centerTitle: true,
      title: Text(Constants.name.toString()),
      actions: <Widget>[
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
        ),
        SizedBox(
          // It means 5 because by out defaultSize = 10
          width: 10,
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    // responsible for body of the design
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShowProfile(diningCourt: items[index].location.toString())),
              );
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_borderRadius),
                        gradient: LinearGradient(
                            colors: [
                              items[index].startColor,
                              items[index].endColor
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: items[index].endColor,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: CustomPaint(
                        size: Size(100, 150),
                        painter: CustomCardShapePainter(_borderRadius,
                            items[index].startColor, items[index].endColor),
                      ),
                    ),
                    Positioned.fill(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Image.network(
                            items[index].imageUrl,
                            height: 130,
                            width: 130,
                          )),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  items[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  items[index].category,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                  ),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        items[index].location,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Avenir',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  items[index].rating.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Avenir',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                //RatingBar(rating: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlaceInfo {
  final String name;
  final String category;
  final String location;
  final double rating;
  final Color startColor;
  final Color endColor;
  final String imageUrl;

  PlaceInfo(this.name, this.startColor, this.endColor, this.rating,
      this.location, this.category, this.imageUrl);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
