import 'package:blog_app/screens/postsScreen.dart';
import 'package:blog_app/widgets/blogApp.dart';
import 'package:blog_app/widgets/postSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:contentful/client.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/services/blogService.dart';
import 'package:share_plus/share_plus.dart';

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
    return postSection != null
        ? BlogApp(
            body: postSection!,
            bottomAppBar: const PostBottomAppBar(urlToShare: 'https://blog.rpenha.net/',),
          )
        : Container();
  }
}

class PostBottomAppBar extends StatefulWidget {
  final String urlToShare; // URL to share

  const PostBottomAppBar({super.key, required this.urlToShare});

  @override
  _PostBottomAppBarState createState() => _PostBottomAppBarState();
}

class _PostBottomAppBarState extends State<PostBottomAppBar> {
  Future<void> _share() async {
    await Share.shareUri(Uri.parse(widget.urlToShare));
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 8,
      height: 60,
      color: const Color.fromRGBO(238, 238, 238, 1), // Set the background color
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostsScreen()),
              )
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.favorite_border),
          //   onPressed: () => {}, // Handle button press
          // ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _share,
          ),
        ],
      ),
    );
  }
}
