import 'package:flutter/cupertino.dart';

import 'meal.dart';
import 'meeal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal>Favoritesmeals;

  FavoriteScreen(this.Favoritesmeals);

  @override
  Widget build(BuildContext context) {
    if (Favoritesmeals.isEmpty) {
      return Center(
        child: Text('You have no favoites yet-start to add some!'),
      );
    }
    else{
      return ListView.builder(itemBuilder:(ctx,index){
      return MealItem(
        id: Favoritesmeals[index].id,
        title: Favoritesmeals[index].title,
        imageUrl: Favoritesmeals[index].imageUrl,
        duration: Favoritesmeals[index].duration,
        complexity: Favoritesmeals[index].complexity,
        affordability: Favoritesmeals[index].affordability,
      );
    },itemCount: Favoritesmeals.length
    );}
  }
}