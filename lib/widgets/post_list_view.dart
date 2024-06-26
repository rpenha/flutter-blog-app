import 'package:blog_app/models/blog.dart';
import 'package:blog_app/widgets/post_summary_section.dart';
import 'package:contentful/client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../services/blog_service.dart';

class PostListView extends StatefulWidget {
  const PostListView({super.key});

  @override
  State<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  static const _pageSize = 3;

  final service = BlogService(Client(
      BearerTokenHTTPClient(dotenv.env['CONTENTFUL_API_KEY']!),
      spaceId: dotenv.env['CONTENTFUL_SPACE_ID']!));

  final PagingController<int, PostSummary> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      if (kDebugMode) {
        print('Loading page ${pageKey ~/ _pageSize}');
      }
      final List<PostSummary> items =
      await service.getPostsSummaries(pageKey, _pageSize);
      final isLastPage = items.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + items.length;
        _pagingController.appendPage(items, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
      color: const Color.fromRGBO(85, 85, 85, 1),
      onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
      ),
      child: PagedListView<int, PostSummary>(
        pagingController: _pagingController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        builderDelegate: PagedChildBuilderDelegate<PostSummary>(
          itemBuilder: (context, item, index) => PostSummarySection(
            summary: item,
          ),
        ),
      ));

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}