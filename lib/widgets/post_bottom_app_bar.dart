import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/services/favorites_service.dart';
import 'package:blog_app/screens/posts_screen.dart';

class PostBottomAppBar extends StatefulWidget {
  final Post post;

  const PostBottomAppBar({super.key, required this.post});

  @override
  State<PostBottomAppBar> createState() => _PostBottomAppBarState();
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