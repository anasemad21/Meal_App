import 'package:flutter/material.dart';
import 'package:mealapp/modules/meal.dart';
import 'package:mealapp/widget/meal_item.dart';

class Favourite  extends StatelessWidget {

  final List<Meal>favouriteMeal;
  Favourite(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeal.isEmpty){
      return Center(
        child:Text('Favourite'),
      );
    }
    else{
      return ListView.builder(
        itemBuilder:(ctx,index){
          return MealItem(
            id: favouriteMeal[index].id,
            imgeUrl: favouriteMeal[index].imageUrl,
            title: favouriteMeal[index].title,
            duration: favouriteMeal[index].duration,
            complexity: favouriteMeal[index].complexity,
            affordability: favouriteMeal[index].affordability,
          );
        },
        itemCount:favouriteMeal.length,
      );
    }
  }
  }