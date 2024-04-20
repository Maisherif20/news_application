import 'Articles.dart';

class NewsResponse {
  NewsResponse({
      this.status, 
      this.totalResults, 
      this.code,
      this.message,
      this.articles,});

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
  String? status;
  String? code;
  String? message;
  int? totalResults;
  List<Articles>? articles;
NewsResponse copyWith({  String? status,
  int? totalResults,
  List<Articles>? articles,
}) => NewsResponse(  status: status ?? this.status,
  totalResults: totalResults ?? this.totalResults,
  articles: articles ?? this.articles,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}