import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';

class TitleSection extends StatelessWidget {
  const TitleSection(
      {super.key,
      required String title,
      required String author,
      required String summary,
      required DateTime? createdAt})
      : _createdAt = createdAt,
        _summary = summary,
        _author = author,
        _title = title;

  final String _title;
  final String _author;
  final String _summary;
  final DateTime? _createdAt;

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
                    _title,
                    style: const TextStyle(
                      color: Color.fromRGBO(85, 85, 85, 1),
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
                          _author,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          Moment(_createdAt!).fromNow(),
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    )),
                Text(
                  _summary,
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
