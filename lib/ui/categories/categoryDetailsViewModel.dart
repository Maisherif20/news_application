import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/dataLayer/newsRepositryImplementation/newsSourceDataSourceImpl.dart';
import 'package:news_application/dataLayer/newsRepositryImplementation/newsSourceRepositoryImpl.dart';
import '../../dataLayer/apiManager/apiManager.dart';
import '../../newsDataSourceContract/newsSourceDataSource.dart';
import '../../repositry_contract/newsSourceRepository.dart';
import '../../sourceResponse/SourceResponse.dart';


class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  late NewsSourceRepository newsSourceRepository;
  late NewsSourceDataSource newsSourceDataSource;
  late ApiManager apiManager;
  CategoryDetailsViewModel() : super(LoadingState(message: "Loading")){
    apiManager = ApiManager();
    newsSourceDataSource = NewsSourceDataSourceImpl(apiManager: apiManager);
    newsSourceRepository = NewsSourceRepositoryImpl(newsSourceDataSource: newsSourceDataSource);
  }
  void loadSources(String categoryId , {String? lang}) async {
    try {
      var sourceList = await newsSourceDataSource.getSource(categoryId , lang: lang);
      emit(SuccessState(sourcesList: sourceList));
      // if (response.message == "error") {
      //   emit(ErrorState(errorMessage: response.message!));
      // } else {
      //   emit(SuccessState(sourcesList: response.sources));
      // }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class CategoryDetailsState {}

class LoadingState extends CategoryDetailsState {
  String? message;
  LoadingState({this.message});
}

class SuccessState extends CategoryDetailsState {
  List<Source>? sourcesList;
  SuccessState({required this.sourcesList});
}

class ErrorState extends CategoryDetailsState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
