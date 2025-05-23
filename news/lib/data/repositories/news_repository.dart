import '../models/article.dart';
import '../datasources/news_remote_data.dart';

abstract class NewsRepository {
  Future<List<Article>> getTopHeadlines(String category, String country);
}

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  // يمكنك إضافة NewsLocalDataSource هنا لاحقاً للتخزين المؤقت

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Article>> getTopHeadlines(String category, String country) async {
    // يمكنك إضافة منطق للتحقق من الاتصال بالإنترنت أو جلب البيانات من التخزين المحلي هنا
    return await remoteDataSource.getTopHeadlines(category, country);
  }
}
