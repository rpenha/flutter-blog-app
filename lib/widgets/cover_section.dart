import 'package:flutter/widgets.dart';

class CoverSection extends StatelessWidget {
  const CoverSection({super.key, required String image}) : _image = image;

  final String _image;

  static String getImageUrl(String image) {
    return 'https:$image';
  }

  @override
  Widget build(BuildContext context) {
    String url = getImageUrl(_image);
    return Image.network(
      url,
      fit: BoxFit.cover,
    );
  }
}