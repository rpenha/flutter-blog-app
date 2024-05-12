import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/widgets/blog_app.dart';
import 'package:blog_app/widgets/post_list_view.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlogApp(
      body: IndexedStack(children: [PostListView()]),
    );
  }
}
