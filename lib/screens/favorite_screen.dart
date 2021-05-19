import 'package:flutter/material.dart';
import '../modules/meal.dart';
import '../widgets/meal_item.dart';

class Favorite extends StatelessWidget {
  final List<Meal> favoriteMeals;

  Favorite(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          "You have no favorite meals yet.",
          style: Theme.of(context).textTheme.title,
        ),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, indx) {
          return MealItem(CategoryMeals: favoriteMeals[indx]);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
