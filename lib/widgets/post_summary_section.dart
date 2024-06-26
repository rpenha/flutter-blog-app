import 'package:blog_app/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/widgets/title_section.dart';
import 'package:blog_app/models/blog.dart';
import 'cover_section.dart';

class PostSummarySection extends StatelessWidget {
  const PostSummarySection({super.key, required PostSummary summary})
      : _summary = summary;

  final PostSummary _summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CoverSection(image: _summary.fields!.cover.fields!.file.url),
            TitleSection(
              title: _summary.fields!.title,
              author: _summary.fields!.author.fields!.name,
              summary: _summary.fields!.summary,
              createdAt: _summary.sys!.createdAt,
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: FlatButton(
                    label: 'Tell me more...',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostScreen(postId: _summary.sys!.id)),
                      );
                    }))
          ],
        )
      ],
    );
  }
}

class FlatButton extends StatelessWidget {
  FlatButton({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white70,
    minimumSize: const Size.fromHeight(40),
    backgroundColor: const Color.fromRGBO(85, 85, 85, 1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 1, // Occupy all available space
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextButton(
                style: flatButtonStyle,
                onPressed: onPressed,
                child: Text(label),
              ),
            )),
      ],
    );
  }
}
