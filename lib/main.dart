import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:blog_app/screens/postsScreen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //const String appTitle = 'This must be the place';
    return MaterialApp(
        //title: appTitle,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'JetBrainsMono',
        ),
        home: const Scaffold(
          // appBar: AppBar(
          //   title: const Text(appTitle),
          // ),
          body: PostsScreen(),
        ));
  }
}
