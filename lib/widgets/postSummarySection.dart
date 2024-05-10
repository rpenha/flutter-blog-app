import 'package:flutter/widgets.dart';
import 'package:blog_app/widgets/titleSection.dart';
import 'package:blog_app/models/postSummary.dart';
import 'coverSectiion.dart';

class PostSummarySection extends StatelessWidget {
  const PostSummarySection({super.key, required this.postSummary});

  final PostSummary postSummary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CoverSection(image: postSummary.fields!.cover.fields!.file.url),
            TitleSection(
              title: postSummary.fields!.title,
              author: postSummary.fields!.author.fields!.name,
              summary: postSummary.fields!.summary,
              createdAt: postSummary.sys!.createdAt,
            ),
          ],
        )
      ],
    );
  }
}