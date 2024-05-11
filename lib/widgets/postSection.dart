import 'package:contentful_rich_text/types/blocks.dart';
import 'package:contentful_rich_text/types/types.dart';
import 'package:flutter/material.dart';
import 'package:contentful_rich_text/contentful_rich_text.dart';
import 'package:blog_app/widgets/titleSection.dart';
import 'package:blog_app/models/blog.dart';
import 'coverSection.dart';

// var options = {
//   renderMark: RenderMark defaultMarkRenderers = RenderMark({
//     [MARKS.BOLD.value]: () => CustomBoldTextStyle, // returns TextStyle
//   }),
//   renderNode: RenderNode defaultNodeRenderers = RenderNode({
//     [BLOCKS.PARAGRAPH.value]: (node, next) => CustomParagraph(next: next(node.content))
//   })
// };

class PostSection extends StatelessWidget {
  PostSection({super.key, this.post});

  final Post? post;

  final Options options = Options(
      renderNode: RenderNode({
    BLOCKS.PARAGRAPH.value: (node, next) => CustomParagraph(node, next)
  }));

  @override
  Widget build(BuildContext context) {
    return post != null
        ? SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CoverSection(image: post!.fields!.cover.fields!.file.url),
                  TitleSection(
                    title: post!.fields!.title,
                    author: post!.fields!.author.fields!.name,
                    summary: post!.fields!.summary,
                    createdAt: post!.sys!.createdAt,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                      child: ContentfulRichText(post!.fields!.body,
                              options: options)
                          .documentToWidgetTree)
                ],
              )
            ]
          ))
        : Container();
  }
}

class CustomParagraph extends StatelessWidget {
  final dynamic node;
  final Next next;

  const CustomParagraph(this.node, this.next, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text.rich(
          style: const TextStyle(
            color: Color.fromRGBO(85, 85, 85, 1),
          ),
          TextSpan(
            children: [
              TextSpan(
                children: next(node['content']),
              ),
            ],
          ),
        ));
  }
}
