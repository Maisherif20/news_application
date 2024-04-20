import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_application/newsResponse/NewsResponse.dart';
import 'package:news_application/sourceResponse/SourceResponse.dart';
class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = "f846cd2f3d9a497d87d650be4e8876de";
  //https://newsapi.org/v2/top-headlines/sources?apiKey=2923b2b7a5b0424091eddadabcccb24a
   Future<SourceResponse> getSources(String categoryId , {String? lang}) async {
                                        //endPoint
    var uri = Uri.https(baseUrl, "/v2/top-headlines/sources", {
      'apiKey': apiKey,
      'category': categoryId,
      'language':lang,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }
  // static Future<SourceResponse> getSourcesOld(String categoryId) async {
  //   //endPoint
  //   var uri = Uri.https(baseUrl, "/v2/top-headlines/sources", {
  //     'apiKey': apiKey,
  //     'category': categoryId,
  //   });
  //   var response = await http.get(uri);
  //   var json = jsonDecode(response.body);
  //   SourceResponse sourceResponse = SourceResponse.fromJson(json);
  //   return sourceResponse;
  // }

 Future<NewsResponse> getNews(String sourceId, {String? lang}) async {
     //,"pageSize":"20"
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=2923b2b7a5b0424091eddadabcccb24a
    var uri = Uri.https(
        baseUrl, "/v2/everything", {'apiKey': apiKey, "sources": sourceId , 'language':lang});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
  // static Future<NewsResponse> getNewsOld(String sourceId) async {
  //   //,"pageSize":"20"
  //   //https://newsapi.org/v2/everything?q=bitcoin&apiKey=2923b2b7a5b0424091eddadabcccb24a
  //   var uri = Uri.https(
  //       baseUrl, "/v2/everything", {'apiKey': apiKey, "sources": sourceId});
  //   var response = await http.get(uri);
  //   var json = jsonDecode(response.body);
  //   NewsResponse newsResponse = NewsResponse.fromJson(json);
  //   return newsResponse;
  // }

  static Future<NewsResponse> searchNews(String q) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=2923b2b7a5b0424091eddadabcccb24a
    var uri = Uri.https(
        baseUrl, "/v2/everything", {'apiKey': apiKey,"q":q });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
 // static  Future<List<Articles>> getNewsPage(String sourceId , {int page = 1}) async {
 //    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=2923b2b7a5b0424091eddadabcccb24a
 //   List<Articles> articles = [];
 //   var uri = Uri.https(
 //        baseUrl, "/v2/everything", {'apiKey': apiKey, "sources": sourceId  ,"pageSize":"20" , "page":"$page"});
 //    var response = await http.get(uri);
 //    var json = jsonDecode(response.body);
 //    List articlList = json["articles"];
 //    for(var element in articles){
 //      articles.add(Articles.fromJson(element));
 //    }
 //    NewsResponse newsResponse = NewsResponse.fromJson(json);
 //    return articles;
 //  }
}
