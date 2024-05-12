import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:contentful/client.dart';
import 'package:blog_app/widgets/blog_app.dart';
import 'package:blog_app/widgets/post_bottom_app_bar.dart';
import 'package:blog_app/widgets/post_section.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/services/blog_service.dart';

class PostScreen extends StatefulWidget {
  final String _postId;

  const PostScreen({super.key, required String postId}) : _postId = postId;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Post? _post;

  final blogService = BlogService(Client(
      BearerTokenHTTPClient(dotenv.env['CONTENTFUL_API_KEY']!),
      spaceId: dotenv.env['CONTENTFUL_SPACE_ID']!));

  void fetchData() async {
    Post loaded = await blogService.getPostById(widget._postId);
    setState(() {
      _post = loaded;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return _post != null
        ? BlogApp(
            body: PostSection(post: _post),
            bottomAppBar: PostBottomAppBar(post: _post!))
        : Container();
  }
}
