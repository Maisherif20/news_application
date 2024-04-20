import 'package:news_application/newsResponse/Articles.dart';

abstract class NewsRepository {
  Future<List<Articles>?>getNews(String sourceId ,  {String? lang});
}