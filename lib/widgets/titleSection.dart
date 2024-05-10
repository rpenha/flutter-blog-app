import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
    required this.author,
    required this.summary,
    required this.createdAt
  });

  final String title;
  final String author;
  final String summary;
  final DateTime? createdAt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          author,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[500],
                          ),
                        ),
                        Text(
                          Moment(createdAt!).fromNow(),
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    )),
                Text(
                  summary,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}