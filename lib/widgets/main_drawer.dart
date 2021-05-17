import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_app/screens/filters.dart';

class MainDrawer extends StatelessWidget {
  Widget setListTile(BuildContext context, String string, IconData iconData,
      Function function) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        string,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w900,
        ),
      ),
      onTap: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          setListTile(
            context,
            "Meal",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          setListTile(
            context,
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
          setListTile(
            context,
            "Exit",
            Icons.exit_to_app,
                () {
                  SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
