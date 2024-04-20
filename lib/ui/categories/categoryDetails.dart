import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/dataLayer/model/categoryData.dart';
import 'package:news_application/providers/settingProvider.dart';
import 'package:news_application/ui/categories/categoryDetailsViewModel.dart';
import 'package:news_application/ui/categories/sourcesTabWidget.dart';
import 'package:provider/provider.dart';
import '../../dataLayer/apiManager/apiManager.dart';

class CategoryDetails extends StatefulWidget {
  CategoryData category;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    var settingProvider = Provider.of<SettingProvider>(context , listen: false);
    viewModel.loadSources(widget.category.id , lang: settingProvider.currentLang);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: ApiManager.getSourcesOld(widget.category.id),
    //     builder: (context, snashot) {
    //       if (snashot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (snashot.hasError || snashot.data?.message == "error") {
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(snashot.data?.message ?? snashot.error.toString()),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     ApiManager.getSourcesOld(widget.category.id);
    //                   },
    //                   child: Text("Try Again"))
    //             ],
    //           ),
    //         );
    //       }
    //       var sourceList = snashot.data?.sources;
    //       return SourcesTabWidget(sources: sourceList!);
    //     });
    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
        bloc: viewModel,
        builder: (context, state) {
          switch (state) {
            case LoadingState():
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            case SuccessState():{
              var list = state.sourcesList;
              if(list == null){
                print("Error");
              }else{
                return SourcesTabWidget(sources: list!);
              }
              return SourcesTabWidget(sources: state.sourcesList! );

            }
            case ErrorState():
              {
                return Center(
                  child: Column(
                    children: [
                      Text(state.errorMessage),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager().getSources(widget.category.id);
                          },
                          child: Text("Try Again"))
                    ],
                  ),
                );
              }

            // case SuccessState():
            //   {
            //     var sourcesList = state.sourcesList;
            //     return SourcesTabWidget(sources: sourcesList!);
            //   }
          }
        });
  }
}
