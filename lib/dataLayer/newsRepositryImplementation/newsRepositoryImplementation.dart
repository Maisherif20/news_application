import 'package:news_application/newsResponse/Articles.dart';
import '../../newsDataSourceContract/newsDataSource.dart';
import '../../repositry_contract/newsRepository.dart';
class NewsRepositoryImplementation extends NewsRepository{
  NewsDataSource dataSource;
  NewsRepositoryImplementation({required this.dataSource});
  @override
  Future<List<Articles>?> getNews(String sourceId   ,  {String? lang}) async{
    var newsList = await dataSource.getNews(sourceId ,lang: lang );
    return newsList;
  }
}