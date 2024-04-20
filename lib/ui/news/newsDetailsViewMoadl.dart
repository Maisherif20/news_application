import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/dataLayer/newsRepositryImplementation/newsRepositoryImplementation.dart';
import 'package:news_application/newsDataSourceImplementation/newsDataSourceImplementation.dart';
import '../../dataLayer/apiManager/apiManager.dart';
import '../../newsDataSourceContract/newsDataSource.dart';
import '../../newsResponse/Articles.dart';
import '../../repositry_contract/newsRepository.dart';
class NewsDetailsViewModal extends Cubit<NewsDetailsState>{
  late NewsRepository newsRepository;
  late NewsDataSource newsDataSource;
  late ApiManager apiManager;
  NewsDetailsViewModal() : super(LoadingState(message: "Loading")){
    apiManager=ApiManager();
    newsDataSource = NewsDataSourceImplementation(apiManager: apiManager);
    newsRepository = NewsRepositoryImplementation(dataSource:newsDataSource );
  }
  void getNewsView(String sourceId ,  {String? lang} ) async {
    try {
      var newsList = await newsRepository.getNews(sourceId );
      emit(SuccessState(articles: newsList));
      // if (response.message == "error") {
      //   emit(ErrorState(errorMessage: response.message!));
      // } else {
      //   emit(SuccessState(articles: response.articles));
      // }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
sealed class NewsDetailsState{}
class LoadingState extends NewsDetailsState{
  String? message;
  LoadingState({this.message});
}
class SuccessState extends NewsDetailsState{
  List<Articles>? articles;
  SuccessState({required this.articles});
}
class ErrorState extends NewsDetailsState{
  String errorMessage;
  ErrorState({required this.errorMessage});
}