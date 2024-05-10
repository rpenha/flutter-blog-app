import 'package:blog_app/widgets/postSummarySection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
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
            body: Text('Go back!')));
  }
}
