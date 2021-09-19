//import 'package:mongo_dart/mongo_dart.dart';

class User {
  final String imagePath;
  final String name;
  final String email;
  final String password;
  final String about;
  final String interests;
  // add major and other things

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.password,
    required this.about,
    required this.interests,
  });
}