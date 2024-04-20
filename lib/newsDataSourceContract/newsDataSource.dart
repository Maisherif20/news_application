import 'package:news_application/newsResponse/Articles.dart';


abstract class NewsDataSource {
  Future<List<Articles>?>getNews(String sourceId ,  {String? lang});
}