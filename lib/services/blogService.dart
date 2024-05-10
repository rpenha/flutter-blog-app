import 'package:blog_app/models/postSummary.dart' show PostSummary;
import 'package:contentful/contentful.dart';

class BlogService {
  BlogService(this.contentful);
  final Client contentful;

  Future<List<PostSummary>> getSummaries() async {
    final collection = await contentful.getEntries<PostSummary>({
      'content_type': 'post',
      'limit': '20',
      'skip': '0',
      'order': '-sys.createdAt',
      'select': [
        'fields.title',
        'fields.slug',
        'fields.author',
        'fields.category',
        'fields.cover',
        'fields.summary',
        'sys'
      ].join(',')
    }, PostSummary.fromJson);

    return collection.items;
  }

  // Future<Event> findBySlug(String slug) async {
  //   final collection = await contentful.getEntries<Event>({
  //     'content_type': 'event',
  //     'fields.slug': slug,
  //     'limit': '1',
  //     'include': '10',
  //   }, Event.fromJson);
  //
  //   return collection.items.first;
  // }
}