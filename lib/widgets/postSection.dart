import 'package:blog_app/screens/postsScreen.dart';
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
                          .documentToWidgetTree),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: FlatButton(
                          label: 'Get me out of here!!!',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PostsScreen()),
                            );
                          }))
                ],
              )
            ],
          ))
        : Container();
  }
}

class FlatButton extends StatelessWidget {
  FlatButton({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white70,
    minimumSize: const Size(88, 36),
    backgroundColor: const Color.fromRGBO(85, 85, 85, 1),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  // final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  //   foregroundColor: Colors.black87,
  //   minimumSize: const Size(88, 36),
  //   padding: const EdgeInsets.symmetric(horizontal: 16),
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(2)),
  //   ),
  // ).copyWith(
  //   side: MaterialStateProperty.resolveWith<BorderSide?>(
  //     (Set<MaterialState> states) {
  //       if (states.contains(MaterialState.pressed)) {
  //         return const BorderSide(
  //           color: Color.fromRGBO(85, 85, 85, 1),
  //           width: 1,
  //         );
  //       }
  //       return null;
  //     },
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: flatButtonStyle,
      onPressed: onPressed,
      child: Text(label),
    );
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
