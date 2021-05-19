import 'package:flutter/material.dart';
import '../modules/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'categoryMeals';
  final List<Meal> _availableMeals;

  CategoryMealsScreen(this._availableMeals);
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
    final CategoryMeals =widget._availableMeals.where((element) {
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
