import 'package:news_application/sourceResponse/SourceResponse.dart';

abstract class NewsSourceRepository{
  Future<List<Source>?>getSource(String categoryId ,  {String? lang});
}