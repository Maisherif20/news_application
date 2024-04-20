import 'package:flutter/material.dart';

import '../../dataLayer/model/categoryData.dart';


class CategoryWidgetItem extends StatelessWidget {
  CategoryData category;
  int index;
  CategoryWidgetItem({required this.category , required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(26),
          topLeft: Radius.circular(26),
          bottomLeft: Radius.circular(index.isEven?26:0),
          bottomRight: Radius.circular(index.isEven?0:26)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(category.imagePath , height: 130,),
          Text(category.title , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold, color: Colors.white),),

        ],
      ),
    );
  }
}
