import 'package:flutter/material.dart';
import '../screen/filters_screen.dart';
class MainDrawer extends StatelessWidget{
  Widget buildListTitle(String title,IconData icon,Function tabHandler){
    return ListTile(
      leading: Icon(icon,size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tabHandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!!!',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),),
          ),
          SizedBox(height: 20),
          buildListTitle('Meal', Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTitle('Filters', Icons.settings,(){Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);}),

        ],
      ),

    );
  }

}