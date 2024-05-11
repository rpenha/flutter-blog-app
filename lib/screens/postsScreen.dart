import 'package:blog_app/widgets/BlogApp.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:contentful/contentful.dart';
import 'package:blog_app/services/blogService.dart';
import 'package:blog_app/widgets/postSummarySection.dart';
import 'package:blog_app/models/blog.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  List<PostSummarySection> posts = [];

  final service = BlogService(Client(
      BearerTokenHTTPClient(dotenv.env['CONTENTFUL_API_KEY']!),
      spaceId: dotenv.env['CONTENTFUL_SPACE_ID']!));

  void fetchData() async {
    List<PostSummary> items = await service.getPostsSummaries();
    setState(() {
      posts =
          items.map((item) => PostSummarySection(postSummary: item)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlogApp(body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: posts,
      ),
    ));
  }
}