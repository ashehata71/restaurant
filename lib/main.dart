import 'dart:ffi';
import './dummy_data.dart';
import './modules/meal.dart';
import './screens/categories_meals.dart';
import 'package:flutter/material.dart';
import './screens/filters.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favorite = [];

  void _toggleFavorite(String mealID) {
    final existingIndex =
        _favorite.indexWhere((element) => element.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        _favorite.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favorite
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
    }
  }
  bool _isFavorite(String mealID)
  {
    return _favorite.any((element) => element.id==mealID);
  }

  void _setFilters(Map<String, bool> _filterDate, BuildContext context) {
    setState(() {
      _filters = _filterDate;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) return false;
        if (_filters['vegan'] && !element.isVegan) return false;
        if (_filters['vegetarian'] && !element.isVegetarian) return false;
        if (_filters['lactose'] && !element.isLactoseFree) return false;
        return true;
      }).toList();
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

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
        '/': (context) => TabsScreen(_favorite),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetails.routeName: (context) => MealDetails(_toggleFavorite,_isFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
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
