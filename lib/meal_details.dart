
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';

class MealDetails extends StatelessWidget {
static const routName='/Meal-details';
final Function taggfavorite;
final Function isfavoritemeal;

MealDetails(this.isfavoritemeal,this.taggfavorite);


  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context)!.settings.arguments as String;
    final selectmeal=DUMMY_DATA.firstWhere((meal) => meal.id==mealId);
    Widget buildSectiontitle(BuildContext ct,String text) {
      return Container(
        margin: EdgeInsets.all(10),
        child: Text(
          text,
          style: Theme
              .of(ct)
              .textTheme
              .subtitle2,),
      );
    }

     Widget buildContainer(Widget child){
      return Container(
           decoration: BoxDecoration(
           color: Colors.white,
           border: Border.all(color: Colors.grey),
       borderRadius: BorderRadius.circular(15),
       ),
       margin: EdgeInsets.all(10),
       padding: EdgeInsets.all(10),
       height: 200,width: 300,
       child: child,);
    }
    return Scaffold(
      appBar: AppBar(title: Text(selectmeal.title),),
      body:SingleChildScrollView(

     child: Column(
      children: <Widget>[
        Container(
            height: 300,
          width: double.infinity,
          child: Image.network(
            selectmeal.imageUrl,
          fit: BoxFit.cover,
          ),

        ),
         buildSectiontitle(context, 'Ingredients'),
buildContainer(
  ListView.builder(
    itemBuilder: (ctx,index)=>Card(
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10)
        ,child: Text(selectmeal.steps[index]),
      ),
    ),
    itemCount: selectmeal.steps.length,
  ),
),
        buildSectiontitle(context, 'Steps'),
        buildContainer(
          ListView.builder(
            itemBuilder: (ctx,index)=>ListTile(
              leading: CircleAvatar(child: Text('# ${ index +1}'),
              ),
              title:Text(selectmeal.steps[index]) ,
            ),
            itemCount: selectmeal.steps.length,
          ),
        ),
            Divider(),
      ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isfavoritemeal(mealId)?Icons.star:Icons.star_border),
      onPressed:()=> taggfavorite(mealId),
      ),
    );
  }
}
