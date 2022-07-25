import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'categories_meals_screen.dart';
import 'category_screen.dart';
import 'package:meals/category_item.dart';
import 'meal.dart';
import 'meal_details.dart';
import 'tabs_screen.dart';
import 'Filter_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}
class _MyApp extends State<MyApp>{
  Map<String,bool>_filters= {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal>avaiablemeals=DUMMY_DATA;
  List<Meal>favoritesmeals=[];

  void _setFilters(Map<String,bool>filterData)
  {
setState(() {
  _filters=filterData;
  avaiablemeals=DUMMY_DATA.where((meal){
   if(_filters['gluten']==true && !meal.isGlutenFree){return false;}
   if(_filters['lactose']==true && !meal.isLactoseFree){return false;}
   if(_filters['vegan']==true && !meal.isVegan){return false;}
   if(_filters['vegetarian']==true && !meal.isVegetarian){return false;}
   return true;

  }).toList();
});
  }
  void _togglefavorite(String myId)
  {
    final existingIndex=favoritesmeals.indexWhere((meal) => meal.id==myId);
if(existingIndex >=0){
  setState(() {
    favoritesmeals.removeAt(existingIndex);
  });
}
else
  {setState(() {
    favoritesmeals.add(DUMMY_DATA.firstWhere((meal) => meal.id==myId));
  });}
  }

  bool _isFavoriteMeals(String Id){
    return favoritesmeals.any((element) => element.id==Id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor:Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1:TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2:TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          subtitle2:  TextStyle(fontSize: 18,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold),
        ),
      ),
      // home:  categoriesscreen(),
      initialRoute: '/',
      routes:
      {
        '/':(ctx)=>TapScreen(favoritesmeals),
        CategoruMealsScreen.routName:(ctx)=>CategoruMealsScreen(avaiablemeals),
        FilterScreen.routName:(ctx)=>FilterScreen(_filters,_setFilters),
        MealDetails.routName:(ctx)=> MealDetails(_isFavoriteMeals,_togglefavorite)
      },
    onUnknownRoute : (settings)
    {
      print(settings.arguments);
      return MaterialPageRoute(builder: (ctx)=>categoriesscreen());

    },

    );
  }
}


