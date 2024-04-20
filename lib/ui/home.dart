import 'package:flutter/material.dart';
import 'package:news_application/sourceResponse/SourceResponse.dart';
import 'package:news_application/ui/categories/categoriesTabWidget.dart';
import 'package:news_application/ui/categories/categoryDetails.dart';
import 'package:news_application/ui/homeDrawer.dart';
import 'package:news_application/ui/search_view.dart';
import 'package:news_application/ui/settingsTab/settingsTabWidget.dart';

import '../dataLayer/model/categoryData.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "Home Screen";
  // bool isSearchedClicked = false;
  // TextEditingController searchController = TextEditingController();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    selectedWidget ==
        CategoriesTabWidet(
          onCategoryItemClicked: onCategoryItemClicked,
        );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assests/image/img.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchView());
                },
                icon: Icon(Icons.search))
          ],
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text(
            "News App",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
        drawer: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  late Widget selectedWidget = CategoriesTabWidet(
    onCategoryItemClicked: onCategoryItemClicked,
  );

  void onDrawerItemClicked(DrawerMenuItem item) {
    if (item == DrawerMenuItem.categories) {
      selectedWidget = CategoriesTabWidet(
        onCategoryItemClicked: onCategoryItemClicked,
      );
      setState(() {});
    } else if (item == DrawerMenuItem.settings) {
      selectedWidget = SettingsTabWidget();
      setState(() {});
    }
    // print("Clicked");
  }

  void onCategoryItemClicked(CategoryData category) {
    selectedWidget = CategoryDetails(category: category);
    setState(() {});
  }

  // Widget searchButton() {
  //   Source source = Source();
  //   return Container(
  //     height: 40,
  //     decoration: BoxDecoration(
  //         color: Colors.white, borderRadius: BorderRadius.circular(20)),
  //     child: TextField(
  //       cursorColor: Colors.black,
  //       controller: widget.searchController,
  //       onChanged: (context) {
  //       },
  //       decoration: InputDecoration(
  //           enabledBorder: InputBorder.none,
  //           focusedBorder: InputBorder.none,
  //           focusColor: Colors.black,
  //           fillColor: Colors.black,
  //           contentPadding: EdgeInsets.fromLTRB(16, 16, 20, 12),
  //           hintText: "Search",
  //           hintStyle: TextStyle(color: Colors.black)),
  //     ),
  //   );
  // }
  // void searchInApi(String sourceId){
  //   ApiManager.getNews(sourceId, widget.searchController.text);
  // }
}
