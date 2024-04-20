import 'package:flutter/material.dart';

class CategoryData {
  String id;
  String title;
  String imagePath;
  Color backgroundColor;
  CategoryData({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
  });
  static List<CategoryData>getAllCategories() {
    return [
      CategoryData(
          id: "sports",
          title: "Sports",
          imagePath: "assests/image/img_2.png",
          backgroundColor: Color.fromRGBO(201, 28, 34, 1)),
      CategoryData(
          id: "general",
          title: "General",
          imagePath: "assests/image/img_3.png",
          backgroundColor: Color.fromRGBO(0, 62, 144, 1)),
      CategoryData(
          id: "health",
          title: "Health",
          imagePath: "assests/image/img_4.png",
          backgroundColor: Color.fromRGBO(237, 30, 121, 1)),
      CategoryData(
          id: "business",
          title: "Business",
          imagePath: "assests/image/img_5.png",
          backgroundColor: Color.fromRGBO(207, 126, 72, 1)),
      CategoryData(
          id: "entertainment",
          title: "Entertainment",
          imagePath: "assests/image/img_6.png",
          backgroundColor: Color.fromRGBO(72, 130, 207, 1)),
      CategoryData(
          id: "science",
          title: "Science",
          imagePath: "assests/image/img_7.png",
          backgroundColor: Color.fromRGBO(242, 211, 82, 1)),
    ];
  }
}
