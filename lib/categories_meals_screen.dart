import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'meeal_item.dart';
import 'meal.dart';

class CategoruMealsScreen extends StatefulWidget {
  static const routName='/Category-meals';
  final List<Meal>aviablemeals;
  CategoruMealsScreen(this.aviablemeals);

  @override
  _CategoruMealsScreen createState() => _CategoruMealsScreen();
}

class _CategoruMealsScreen extends State<CategoruMealsScreen> {
  late String categorytitle;
  late List<Meal>displaymeals;
  var loddeddata=false;
  @override
  void didChangeDependencies() {

    if(!loddeddata) {
      final routeArgs = ModalRoute
          .of(context)!
          .settings
          .arguments as Map<String, String>;
       categorytitle = routeArgs['title']as String;
      final id = routeArgs['id'];
       displaymeals = widget.aviablemeals.where((meal) => meal.categories.contains(id))
          .toList();
      loddeddata=true;
    }
    super.didChangeDependencies();
  }
  //  void removeItems (String Id){
  //    setState(() {
  //      displaymeals.removeWhere((meal) => meal.id==Id);
  //    });
  //
  // }
  @override
  Widget build(BuildContext context) {
    // final String id;
    // final String title;
    //
    // CategoruMealsScreen(this.id, this.title);


    return Scaffold(
      appBar: AppBar(title:Text('The Racipes ') ,),
      body:
      ListView.builder(itemBuilder:(ctx,index){
        return MealItem(
          id: displaymeals[index].id,
          title: displaymeals[index].title,
          imageUrl: displaymeals[index].imageUrl,
          duration: displaymeals[index].duration,
          complexity: displaymeals[index].complexity,
          affordability: displaymeals[index].affordability,

        );
      },itemCount: displaymeals.length
      ),
    );

  }
}

