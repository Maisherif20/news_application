import 'package:flutter/material.dart';
import 'package:news_application/ui/categories/categoryWidgetItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../dataLayer/model/categoryData.dart';
typedef OnCategoryItemClicked = void Function(CategoryData category);
class CategoriesTabWidet extends StatelessWidget {
  OnCategoryItemClicked onCategoryItemClicked;
  CategoriesTabWidet({required this.onCategoryItemClicked});
  List<CategoryData> categoriesList = CategoryData.getAllCategories();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context)!.pick_your_category_of_interest,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(79, 90, 105, 1))),
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 25, crossAxisSpacing: 25),
            itemBuilder: (context, index) => InkWell(
              onTap: (){
                onCategoryItemClicked(categoriesList[index]);
              },
                child: CategoryWidgetItem(
                    category: categoriesList[index], index: index)),
            itemCount: categoriesList.length,
          ))
        ],
      ),
    );
  }
}
