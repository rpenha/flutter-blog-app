import 'package:blog_app/widgets/BlogApp.dart';
import 'package:blog_app/widgets/postSection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:contentful/client.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/services/blogService.dart';

class PostScreen extends StatefulWidget {
  final String postId;

  const PostScreen({super.key, required this.postId});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  Widget? postSection;

  final service = BlogService(Client(
      BearerTokenHTTPClient(dotenv.env['CONTENTFUL_API_KEY']!),
      spaceId: dotenv.env['CONTENTFUL_SPACE_ID']!));

  void fetchData() async {
    Post post = await service.getPostById(widget.postId);
    setState(() {
      postSection = PostSection(post: post);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return postSection != null ? BlogApp(body: postSection!) : Container();
  }
}
