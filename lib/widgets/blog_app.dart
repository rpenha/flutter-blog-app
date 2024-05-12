import 'package:flutter/material.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key, required Widget body, Widget? bottomAppBar}) : _bottomAppBar = bottomAppBar, _body = body;

  final Widget _body;
  final Widget? _bottomAppBar;

  @override
  Widget build(BuildContext context) {
    //const String appTitle = 'This must be the place';
    return MaterialApp(
        //title: appTitle,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'JetBrainsMono',
          scaffoldBackgroundColor: const Color.fromRGBO(238, 238, 238, 1),
        ),
        home: Scaffold(
          bottomNavigationBar: _bottomAppBar,
          // appBar: AppBar(
          //   title: const Text(appTitle),
          // ),
          body: _body,
        ));
  }
}
