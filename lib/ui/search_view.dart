import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/ui/news/searchNewsViewModel.dart';
import '../dataLayer/apiManager/apiManager.dart';
import 'news/newsItemWidget.dart';

class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.searchNews(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError || snapshot.data?.message == "error") {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data?.message ?? snapshot.error.toString()),
                  ElevatedButton(onPressed: () {}, child: Text("Try Again"))
                ],
              ),
            );
          }
          var newsList = snapshot.data?.articles;
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  NewsItemWidget(articles: newsList![index]),
              itemCount: newsList?.length,
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: query.isEmpty?Center(child: Text("Please enter text to Search" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25),)):FutureBuilder(
          future: ApiManager.searchNews(query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError || snapshot.data?.message == "error") {
              return Center(
                child: Column(
                  children: [
                    Text(snapshot.data?.message ?? snapshot.error.toString()),
                    ElevatedButton(onPressed: () {}, child: Text("Try Again"))
                  ],
                ),
              );
            }
            var newsList = snapshot.data?.articles;
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    NewsItemWidget(articles: newsList![index]),
                itemCount: newsList?.length,
              ),
            );
          }),
    );
  }
}
