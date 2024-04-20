import 'package:flutter/material.dart';
import 'package:news_application/newsResponse/Articles.dart';
import 'package:news_application/ui/news/newsDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItemWidget extends StatelessWidget {
  Articles articles;
  NewsItemWidget({required this.articles});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetails(image: articles.urlToImage!, title: articles.title!, content: articles.content!, url: articles.url!)));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: articles.urlToImage ?? "",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  articles.title ?? "",
                  style: TextStyle(
                      color: Color.fromRGBO(66, 80, 92, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                articles.publishedAt ?? "",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Color.fromRGBO(66, 80, 92, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
  }
}
