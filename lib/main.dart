import 'package:flutter/material.dart';
import './dummy_data.dart';
import 'package:mealapp/screen/favourit_screen.dart';
import 'package:mealapp/screen/filters_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/category_meals_screen.dart';
import './screen/tabs_screen.dart';
import 'modules/meal.dart';

void main() {
  runApp(MyApp());
}
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
            title: TextStyle(
            fontSize: 20,
          fontFamily:'RobotoCondensed',
           fontWeight: FontWeight.bold
        ),
        ),
      ),
      //home: MyHomePage(),
      //home: CategoriesScreen(),
      routes: {
        '/': (context) => Tab(),
        CategoryMealsScreen.routName:(context)=> CategoryMealsScreen(),
        MealDetailScreen.routName:(context)=> MealDetailScreen(),
      },
    );
  }
}*/

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>_filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,

};
  List<Meal>_availableMeal=DUMMY_MEALS;
  List<Meal>_favouriteMeal=[];

  void _setFilters(Map<String,bool>_filterData){
    setState(() {
      _filters=_filterData;

      _availableMeal=DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  void _toggleFavorite(String mealId){
    final existingIndex=_favouriteMeal.indexWhere((meal) => meal.id==mealId);
    if(existingIndex>=0){
      setState(() {
        _favouriteMeal.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favouriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }
  bool _isMealFavourite(String id){
    return _favouriteMeal.any((meal) => meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          title: TextStyle(
              fontSize: 20,
              fontFamily:'RobotoCondensed',
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      //home: MyHomePage(),
      //home: CategoriesScreen(),
      routes: {
        '/': (context) => TabScreen(_favouriteMeal),
        CategoryMealsScreen.routName:(context)=> CategoryMealsScreen(_availableMeal),
        MealDetailScreen.routName:(context)=> MealDetailScreen(_toggleFavorite,_isMealFavourite),
        FilterScreen.routeName:(context)=>FilterScreen(_filters,_setFilters),
      },
    );
  }
}
