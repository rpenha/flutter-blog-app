import 'package:blog_app/screens/posts_screen.dart';
import 'package:blog_app/services/favorites_service.dart';
import 'package:blog_app/widgets/blog_app.dart';
import 'package:blog_app/widgets/post_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:contentful/client.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/services/blog_service.dart';
import 'package:share_plus/share_plus.dart';

class PostScreen extends StatefulWidget {
  final String postId;

  const PostScreen({super.key, required this.postId});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Post? post;

  final blogService = BlogService(Client(
      BearerTokenHTTPClient(dotenv.env['CONTENTFUL_API_KEY']!),
      spaceId: dotenv.env['CONTENTFUL_SPACE_ID']!));

  void fetchData() async {
    Post loaded = await blogService.getPostById(widget.postId);
    setState(() {
      post = loaded;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return post != null
        ? BlogApp(
            body: PostSection(post: post),
            bottomAppBar: PostBottomAppBar(post: post!))
        : Container();
  }
}

class PostBottomAppBar extends StatefulWidget {
  final Post post;

  PostBottomAppBar({super.key, required this.post});

  @override
  _PostBottomAppBarState createState() => _PostBottomAppBarState();
}

class _PostBottomAppBarState extends State<PostBottomAppBar> {
  final FavoritesService favoritesService = FavoritesService();
  late bool _isFavorite;

  static Uri _getPostUri(Post post) {
    return Uri.parse('https://blog.rpenha.net/${post.fields!.slug}');
  }

  Future<void> _share() async {
    await Share.shareUri(_getPostUri(widget.post));
  }

  void _toggleFavorite() {
    setState(() {
      String postId = widget.post.sys!.id;
      favoritesService.toggleFavorite(postId);
      _isFavorite = favoritesService.containsFavorite(postId);
    });
  }

  @override
  void initState() {
    super.initState();
    String postId = widget.post.sys!.id;
    _isFavorite = favoritesService.containsFavorite(postId);
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
          IconButton(
              icon: _isFavorite
                  ? const Icon(Icons.favorite,
                      color: Color.fromRGBO(163, 0, 0, 1))
                  : const Icon(Icons.favorite_border),
              onPressed: () => _toggleFavorite()),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _share,
          ),
        ],
      ),
    );
  }
}
