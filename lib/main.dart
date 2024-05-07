import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'This must be the place';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostSummarySection(
                  coverImage:
                      'https://images.ctfassets.net/xj8ro83rjak0/19Hy9qmp6jVtfA7xw8appC/68b2ac20070bfd93e79685fd9bc029d5/cd2f68ab4f875e716f34c6fbafad0fb7.jpg',
                  title:
                      'Gentlemen, Shall We Discuss the F1 Conundrum? Senna vs. Prost: A Delightfully Complex Tango',
                  author: 'Hans Landa',
                  summary:
                      'F1 legends Senna & Prost: Rainmaster vs. The Professor. Passionate brilliance battles strategic finesse in an unforgettable rivalry that defines F1 greatness. Who wins? You decide!'),
              PostSummarySection(
                  coverImage:
                      'https://images.ctfassets.net/xj8ro83rjak0/JxaRK31FuwF6rH7CWZXqA/2c4cd99c2fda6ea6f2e370a2654a5002/js-sucks.png',
                  title:
                      'Ah, Javascript on the Server? Mijo, That\'s a One-Way Ticket to Donkey Town!',
                  author: 'Hans Landa',
                  summary:
                      'F1 legends Senna & Prost: Rainmaster vs. The Professor. Passionate brilliance battles strategic finesse in an unforgettable rivalry that defines F1 greatness. Who wins? You decide!'),
            ],
          ),
        ),
      ),
    );
  }
}

class PostSummarySection extends StatelessWidget {
  const PostSummarySection(
      {super.key,
      required this.coverImage,
      required this.title,
      required this.author,
      required this.summary});

  final String coverImage;
  final String title;
  final String author;
  final String summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CoverImage(image: coverImage),
            TitleSection(
              title: title,
              author: author,
              summary: summary,
            ),
          ],
        )
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
    required this.author,
    required this.summary,
  });

  final String title;
  final String author;
  final String summary;

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
                          'April 15, 2024',
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

class CoverImage extends StatelessWidget {
  const CoverImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.cover,
    );
  }
}
