import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/ui/news/newsDetailsViewMoadl.dart';
import 'package:news_application/ui/news/newsItemWidget.dart';
import 'package:provider/provider.dart';
import '../../dataLayer/apiManager/apiManager.dart';
import '../../providers/settingProvider.dart';
import '../../sourceResponse/SourceResponse.dart';

class NewsListWidget extends StatefulWidget {
  Source source;
  NewsListWidget({required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  NewsDetailsViewModal viewModal =  NewsDetailsViewModal();
  void initState() {
    var settingProvider = Provider.of<SettingProvider>(context , listen: false);
    viewModal.getNewsView(widget.source.id! , lang: settingProvider.currentLang);
    super.initState();
  }


  @override
  void didUpdateWidget(covariant NewsListWidget oldWidget) {
    var settingProvider = Provider.of<SettingProvider>(context , listen: false);
    viewModal.getNewsView(widget.source.id! , lang: settingProvider.currentLang);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // if(getNewPage)
    //   {
    //     ApiManager.getNewsPage(widget.source.id! , page: page++).then((value) {
    //       news
    //
    //     });
    //   }
//     return FutureBuilder(future: ApiManager.getNewsOld(widget.source.id!),
//     builder:(context , snapshot){
//   if(snapshot.connectionState== ConnectionState.waiting)
//   {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
//   if(snapshot.hasError|| snapshot.data?.message=="error"){
//     return Center(child: Column(
//       children: [
//         Text(snapshot.data?.message ?? snapshot.error.toString()),
//         ElevatedButton(onPressed: (){
//           ApiManager.getNewsOld(widget.source.id!);
//         }, child: Text("Try Again"))
//
//     ],),);
//   }
//   var newsList = snapshot.data?.articles;
//   return Expanded(
//     child: ListView.builder(itemBuilder:(context , index)=>NewsItemWidget(articles: newsList![index]) , itemCount: newsList?.length, ),
//
//   );
//     }
// );
    return BlocBuilder<NewsDetailsViewModal, NewsDetailsState>(
        bloc: viewModal,
        builder: (context, state) {
          switch (state) {
            case LoadingState():
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ErrorState():
              {
                return Center(
                  child: Column(
                    children: [
                      Text(state.errorMessage),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager().getNews(widget.source.id!);
                          },
                          child: Text("Try Again"))
                    ],
                  ),
                );
              }
            case SuccessState():
              {
                var newsList = state.articles;
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        NewsItemWidget(articles: newsList![index]),
                    itemCount: newsList?.length,
                  ),
                );
              }
          }
        });
  }
}
