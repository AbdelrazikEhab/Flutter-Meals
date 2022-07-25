import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'category_screen.dart';
import 'favorite_sceen.dart';
import 'Main_drawer.dart';
import 'meal.dart';

class TapScreen extends StatefulWidget {

  final List<Meal>_favoritesmeals;

  TapScreen(this._favoritesmeals);

  @override
  _TapScreenState createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  int _selectpageindex=0;
  late final  List<Map<String , Object>>_page;
  @override
  void initState() {

    _page=[
      {
        'page' : categoriesscreen(),
        'title' : 'Ctegories',
      },
      {
        'page' : FavoriteScreen(widget._favoritesmeals),
        'title' :'Your Favorites',
      },
    ];    super.initState();
  }




  void _selectpage(int index){
setState(() {
  _selectpageindex=index;
});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_page[_selectpageindex]['title']as String),
        ),
      drawer: MainDrawer(),
      body: _page[_selectpageindex]['page']as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _selectpageindex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
              label: 'Favorites'
          ),
        ],
      ),
    );
  }
}
