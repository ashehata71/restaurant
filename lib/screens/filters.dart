import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function _setFilters;
  final Map<String, bool> _filters;

  const FiltersScreen(this._filters, this._setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
  static const routeName = "filter";
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  initState() {
    isGlutenFree = widget._filters['gluten'];
    isLactoseFree = widget._filters['lactose'];
    isVegan = widget._filters['vegan'];
    isVegetarian = widget._filters['vegetarian'];
    super.initState();
  }

  Widget setSwitchListTile(
    String title,
    String subTitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).accentColor,
        ),
      ),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.black,
            ),
            onPressed: () {
              final Map<String, bool> _filter = {
                'gluten': isGlutenFree,
                'vegan': isVegan,
                'vegetarian': isVegetarian,
                'lactose': isLactoseFree,
              };
              widget._setFilters(_filter,context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                setSwitchListTile(
                  "GlutenFree",
                  "Only include gluten free meals",
                  isGlutenFree,
                  (value) {
                    setState(() {
                      isGlutenFree = value;
                    });
                  },
                ),
                setSwitchListTile(
                  "LactoseFree",
                  "Only include lactose free meals",
                  isLactoseFree,
                  (value) {
                    setState(() {
                      isLactoseFree = value;
                    });
                  },
                ),
                setSwitchListTile(
                  "Vegan",
                  "Only include vegan meals",
                  isVegan,
                  (value) {
                    setState(() {
                      isVegan = value;
                    });
                  },
                ),
                setSwitchListTile(
                  "Vegetarian",
                  "Only include vegetarian meals",
                  isVegetarian,
                  (value) {
                    setState(() {
                      isVegetarian = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
