import 'dart:developer';

import '../models/article.dart';
import '../../core/api/api_client.dart';
import '../../core/api/api_constants.dart';

abstract class NewsRemoteDataSource {
  Future<List<Article>> getTopHeadlines(String category, String country);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final ApiClient apiClient;

  NewsRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<Article>> getTopHeadlines(String category, String country) async {
    try {
      final response = await apiClient.get(
        ApiConstants.topHeadlines,
        queryParameters: {
          'country': country, // e.g., 'us', 'eg'
          'category': category, // e.g., 'sports', 'politics', 'entertainment'
        },
      );

      if (response.statusCode == 200) {
        final articles =
            (response.data['articles'] as List)
                .map(
                  (articleJson) =>
                      Article.fromJson(articleJson as Map<String, dynamic>),
                )
                .toList();
        return articles;
      } else {
        // يمكنك التعامل مع رموز الحالة الأخرى هنا
        throw Exception('Failed to load news: ${response.statusMessage}');
      }
    } catch (e) {
      log('Error fetching news: $e');
      throw Exception('Failed to load news');
    }
  }
}
