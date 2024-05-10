import 'package:blog_app/screens/postScreen.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/widgets/titleSection.dart';
import 'package:blog_app/models/postSummary.dart';
import 'coverSection.dart';

class PostSummarySection extends StatelessWidget {
  PostSummarySection({super.key, required this.postSummary});

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
            FlatButton(
                label: 'Read more',
                onPressed: () {
                  print('Pressed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PostScreen()),
                  );
                })
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
