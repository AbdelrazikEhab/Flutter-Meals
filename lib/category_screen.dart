import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/category_item.dart';
import 'dummy_data.dart';

class categoriesscreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: GridView(
        padding: EdgeInsets.all(25),
      children:
      DUMMY_CATEGORIES.map(
            (catdata)=> CategoryItem(catdata.id,catdata.title,catdata.color,),
      ).toList()
      ,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing:20 ,
        mainAxisSpacing:20 ,
      ),


    ),);
  }


}