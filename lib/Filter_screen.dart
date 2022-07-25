import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/Filter-screen';
  final Function saveFilters;
  final Map<String,bool>currentfilter;


  FilterScreen(this.currentfilter,this.saveFilters);

  @override
  _FilterScreen createState() => _FilterScreen();

}
class _FilterScreen extends State<FilterScreen>{


   bool _glutenfree=false;
   bool _Vegetarin=false;
   bool _Vegan=false;
   bool _loctosefree=false;

   Widget _buildSwitchListTile(String title,String description,bool current,covariant update){
    return SwitchListTile(title:  Text(title),
       value: current,
       subtitle:  Text(description),
       onChanged: update
     );
   }
   @override
  void initState() {
     _glutenfree=widget.currentfilter['gluten']as bool;
     _loctosefree=widget.currentfilter['lactose']as bool;
     _Vegan=widget.currentfilter['vegan']as bool;
     _Vegetarin=widget.currentfilter['vegetarian']as bool;
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters'),
      actions: <Widget>[IconButton(icon: Icon(Icons.save),onPressed:(){
        final selectfilters={
          'gluten': _glutenfree,
          'lactose': _loctosefree,
          'vegan': _Vegan,
          'vegetarian': _Vegetarin,
        };
        widget.saveFilters(selectfilters);}
        ,)
      ],
      ),
     drawer:MainDrawer() ,
     body: Column(
          children:<Widget> [
         Container(
           padding: const EdgeInsets.all(15),
           child: Text('Addjust your meal section ',
               style: Theme.of(context).textTheme.subtitle2),
         ),
         Expanded(
           child: ListView(
             children:<Widget>[
                    _buildSwitchListTile('Gluten-free', 'Only include gluten-free meals', _glutenfree,
                          (newvalue){
                        setState(() {
                          _glutenfree=newvalue;
                        });
                      },
                    ),
               _buildSwitchListTile('Loctose-free', 'Only include loctose-free meals', _loctosefree,
                     (newvalue){
                   setState(() {
                     _loctosefree=newvalue;
                   });
                 },
               ),
               _buildSwitchListTile('Vegetarin-free', 'Only include vegetarin-free meals', _Vegetarin,
                     (newvalue){
                   setState(() {
                     _Vegetarin=newvalue;
                   });
                 },
               ),
               _buildSwitchListTile('Vegan-free', 'Only include vegan-free meals', _Vegan,
                     (newvalue){
                   setState(() {
                     _Vegan=newvalue;
                   });
                 },
               ),
             ]
         ),
         ),
  ],
      ),
    );
  }
}
