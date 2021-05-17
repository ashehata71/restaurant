import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';
class FiltersScreen extends StatelessWidget {
  static const routeName='FiltersScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      body: null,
      drawer: MainDrawer(),
    );
  }
}
