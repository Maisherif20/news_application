import 'package:news_application/dataLayer/apiManager/apiManager.dart';
import 'package:news_application/newsDataSourceContract/newsDataSource.dart';
import 'package:news_application/newsResponse/Articles.dart';
class NewsDataSourceImplementation extends NewsDataSource{
  ApiManager apiManager;
  NewsDataSourceImplementation({required this.apiManager});
  @override
  Future<List<Articles>?> getNews(String sourceId ,  {String? lang})async {
    var response = await apiManager.getNews(sourceId , lang: lang );
    return response.articles;

  }

}