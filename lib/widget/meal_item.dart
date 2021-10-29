import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screen/meal_detail_screen.dart';
import '../modules/meal.dart';

class MealItem extends StatelessWidget {
  final String imgeUrl;
  final Complexity complexity;
  final Affordability affordability;
  final String title;
  final String id;
  final int duration;


  const MealItem(
      {@required this.imgeUrl,
        @required this.complexity,
        @required this.affordability,
        @required this.title,
        @required this.id,
        @required this.duration,
      });


  String get complexityText{
    switch(complexity){
      case Complexity.Simple:return'Simple';break;
      case Complexity.Challenging:return'Challenging';break;
      case Complexity.Hard:return'Hard';break;
      default:return'Unknown';break;
    }
  }

  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:return'Affordable';break;
      case Affordability.Luxurious:return'Luxurious';break;
      case Affordability.Pricey:return'Pricey';break;
      default:return'Unknown';break;
    }
  }


  void SelectMeaal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routName,
    arguments: id,
    ).then((result) {
     // if(result!=null) removeItem(result);
    });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> SelectMeaal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imgeUrl,height: 200,width: double.infinity,fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26,color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text("$complexityText"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text("$affordabilityText"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
