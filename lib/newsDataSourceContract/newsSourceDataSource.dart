import 'package:news_application/sourceResponse/SourceResponse.dart';

abstract class NewsSourceDataSource{
 Future<List<Source>?> getSource(String categoryId  , {String? lang});
}