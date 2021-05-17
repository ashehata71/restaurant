import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'categoryMeals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final catArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final CategoryTitle = catArg['title'];
    final CategoryID = catArg['id'];
    final CategoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(CategoryID);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, indx) {
          return MealItem(CategoryMeals: CategoryMeals[indx]);
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }
}
