import 'package:contentful_rich_text/types/blocks.dart';
import 'package:contentful_rich_text/types/types.dart';
import 'package:flutter/material.dart';
import 'package:contentful_rich_text/contentful_rich_text.dart';
import 'package:blog_app/widgets/title_section.dart';
import 'package:blog_app/models/blog.dart';
import 'cover_section.dart';

class PostSection extends StatelessWidget {
  PostSection({super.key, Post? post}) : _post = post;

  final Post? _post;

  final Options options = Options(
      renderNode: RenderNode({
    BLOCKS.PARAGRAPH.value: (node, next) => CustomParagraph(node, next)
  }));

  @override
  Widget build(BuildContext context) {
    return _post != null
        ? SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              children: [
                CoverSection(image: _post.fields!.cover.fields!.file.url),
                TitleSection(
                  title: _post.fields!.title,
                  author: _post.fields!.author.fields!.name,
                  summary: _post.fields!.summary,
                  createdAt: _post.sys!.createdAt,
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                    child:
                        ContentfulRichText(_post.fields!.body, options: options)
                            .documentToWidgetTree)
              ],
            )
          ]))
        : Container();
  }
}

class CustomParagraph extends StatelessWidget {
  final dynamic _node;
  final Next _next;

  const CustomParagraph(this._node, this._next, {super.key});

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
                children: _next(_node['content']),
              ),
            ],
          ),
        ));
  }
}
