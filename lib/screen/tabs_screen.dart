import 'package:flutter/material.dart';
import 'package:mealapp/modules/meal.dart';
import '../widget/main_drawer.dart';
import 'categories_screen.dart';
import 'favourit_screen.dart';
class TabScreen extends StatefulWidget{

  final List<Meal>favouriteMeal;
  const TabScreen(this.favouriteMeal);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String,Object>>_pages;
  int _selectpageindex=0;
  @override
  void initState() {
    _pages=[
      {
      'page':CategoriesScreen(),
      'title':'Categories',},
      {
        'page':Favourite(widget.favouriteMeal),
        'title':'Your Favourites',
      },
    ];
    super.initState();
  }
  void _SelectPage(value){
    setState((){
      _selectpageindex=value;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectpageindex]['title'])),
      body: _pages[_selectpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _SelectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectpageindex ,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourite'),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
