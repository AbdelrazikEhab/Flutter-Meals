

import 'package:flutter/cupertino.dart';
import 'categories_meals_screen.dart';
import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget{
final String title;
final Color color;
final String id;
CategoryItem(this.id,this.title,this.color);
void SelectCategory(BuildContext cx)
{
Navigator.of(cx).pushNamed('/Category-meals',arguments:
{'id':id,
  'title':title
}
);


}

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return InkWell(
      onTap:()=>SelectCategory(context) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(30),
      child: Container(
      padding: const EdgeInsets.all(15) ,
      child:
      Text(
        title,
        style:Theme.of(context).textTheme.subtitle2,

      ),
      decoration: BoxDecoration(
          gradient:LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
        borderRadius: BorderRadius.circular(15),
      ),
      ),
    );
  }



}