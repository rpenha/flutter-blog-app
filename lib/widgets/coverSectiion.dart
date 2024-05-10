import 'package:flutter/widgets.dart';

class CoverSection extends StatelessWidget {
  const CoverSection({super.key, required this.image});

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