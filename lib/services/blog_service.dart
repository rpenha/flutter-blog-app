import 'package:contentful/contentful.dart';
import 'package:blog_app/models/blog.dart' show Post, PostSummary;

class BlogService {
  BlogService(this.contentful);
  final Client contentful;

  Future<List<PostSummary>> getPostsSummaries(pageKey, size) async {
    final collection = await contentful.getEntries<PostSummary>({
      'content_type': 'post',
      'limit': size.toString(),
      'skip': pageKey.toString(),
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

  Future<Post> getPostById(String id) async {
    final collection = await contentful.getEntries<Post>({
      'content_type': 'post',
      'sys.id': id,
      'limit': '1',
      'select': [
        'fields.title',
        'fields.slug',
        'fields.author',
        'fields.category',
        'fields.cover',
        'fields.summary',
        'fields.body',
        'sys'
      ].join(',')
    }, Post.fromJson);

    return collection.items.first;
  }
}