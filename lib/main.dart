import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:blog_app/screens/postsScreen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const PostsScreen());
}
