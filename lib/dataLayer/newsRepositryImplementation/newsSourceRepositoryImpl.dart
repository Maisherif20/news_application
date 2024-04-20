
import 'package:news_application/dataLayer/apiManager/apiManager.dart';
import 'package:news_application/dataLayer/newsRepositryImplementation/newsSourceDataSourceImpl.dart';
import 'package:news_application/repositry_contract/newsSourceRepository.dart';
import 'package:news_application/sourceResponse/SourceResponse.dart';
import '../../newsDataSourceContract/newsSourceDataSource.dart';
class NewsSourceRepositoryImpl extends NewsSourceRepository{
  NewsSourceDataSource newsSourceDataSource;
  NewsSourceRepositoryImpl({required this.newsSourceDataSource});
  @override
  Future<List<Source>?> getSource(String categoryId , {String? lang})async {
   var sourceList= await newsSourceDataSource.getSource(categoryId , lang: lang);
   return sourceList;
  }
}