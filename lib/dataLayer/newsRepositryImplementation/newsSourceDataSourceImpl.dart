import 'package:news_application/dataLayer/apiManager/apiManager.dart';
import 'package:news_application/newsDataSourceContract/newsSourceDataSource.dart';
import 'package:news_application/sourceResponse/SourceResponse.dart';
class NewsSourceDataSourceImpl extends NewsSourceDataSource{
  ApiManager apiManager;
  NewsSourceDataSourceImpl({required this.apiManager});
  @override
  Future<List<Source>?> getSource(String categoryId , {String? lang}) async{
    var response  =await  apiManager.getSources(categoryId , lang: lang);
    return response.sources;
  }
}