import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dataLayer/apiManager/apiManager.dart';
import '../../newsResponse/Articles.dart';

class SearchNewsViewModal extends Cubit<SearchNewsState>{
  SearchNewsViewModal() : super(LoadingState(message: "Loading"));
  void searchNewsView(String search) async {
    try {
      var response = await ApiManager.searchNews(search);
      if (response.message == "error") {
        emit(ErrorState(errorMessage: response.message!));
      } else {
        emit(SuccessState(articles: response.articles));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
sealed class SearchNewsState{}
class LoadingState extends SearchNewsState{
  String? message;
  LoadingState({this.message});
}
class SuccessState extends SearchNewsState{
  List<Articles>? articles;
  SuccessState({this.articles});
}
class ErrorState extends SearchNewsState{
  String errorMessage;
  ErrorState({required this.errorMessage});
}