import 'package:blog_app/models/postSummary.dart';
import 'package:blog_app/services/blogService.dart';
import 'package:contentful/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //const String appTitle = 'This must be the place';
    return MaterialApp(
      //title: appTitle,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'JetBrainsMono',
      ),
      home:const Scaffold(
        // appBar: AppBar(
        //   title: const Text(appTitle),
        // ),
        body:  const PostListWidget(),
      )
    );
  }
}

class PostListWidget extends StatefulWidget {
  const PostListWidget({super.key});

  @override
  _PostListWidgetState createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  final service = BlogService(Client(
      BearerTokenHTTPClient(dotenv.env['CONTENTFUL_API_KEY']!),
      spaceId: dotenv.env['CONTENTFUL_SPACE_ID']!));

  void fetchData() async {
    List<PostSummary> items = await service.getSummaries();
    setState(() {
      posts =
          items.map((item) => PostSummarySection(postSummary: item)).toList();
    });
  }

  List<PostSummarySection> posts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: posts,
      ),
    );
  }
}

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
            CoverImage(image: postSummary.fields!.cover.fields!.file.url),
            TitleSection(
              title: postSummary.fields!.title,
              author: postSummary.fields!.author.fields!.name,
              summary: postSummary.fields!.summary,
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

  static String getImageUrl(String image) {
    return 'https:$image';
  }

  @override
  Widget build(BuildContext context) {
    String url = getImageUrl(image);
    return Image.network(
      url,
      fit: BoxFit.cover,
    );
  }
}
