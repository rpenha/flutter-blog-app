import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:contentful/contentful.dart';
import 'package:blog_app/services/blogService.dart';
import 'package:blog_app/widgets/postSummarySection.dart';
import 'package:blog_app/models/postSummary.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final service = BlogService(Client(
      BearerTokenHTTPClient(dotenv.env['CONTENTFUL_API_KEY']!),
      spaceId: dotenv.env['CONTENTFUL_SPACE_ID']!));

  void fetchData() async {
    List<PostSummary> items = await service.getSummaries();
    setState(() {
      posts =
          items.map((item) => PostSummarySection(postSummary: item)).toList();
    });
  }

  List<PostSummarySection> posts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: posts,
      ),
    );
  }
}