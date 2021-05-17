import 'dart:ffi';
import 'package:meal_app/screens/categories_meals.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.orange,
        canvasColor: Color.fromRGBO(255, 250, 220, 1),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color.fromRGBO(20, 30, 50, 0.5),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 30, 50, 0.5),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //home: MyHomePage(),
      //home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetails.routeName:(context)=>MealDetails(),
        FiltersScreen.routeName:(context)=>FiltersScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}
