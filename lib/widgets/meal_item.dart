import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/screens/categories_meals.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal CategoryMeals;

  const MealItem({@required this.CategoryMeals});

  String get complexity {
    switch (CategoryMeals.complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get affordability {
    switch (CategoryMeals.affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetails.routeName,
      arguments: CategoryMeals.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    CategoryMeals.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    child: Text(
                      CategoryMeals.title,
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black38,
                        fontFamily: 'RobotoCondensed',
                        fontSize: 25,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${CategoryMeals.duration} min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.shopping_bag),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$complexity"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$affordability"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
