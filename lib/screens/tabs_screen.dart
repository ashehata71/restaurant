import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favorite;

  TabsScreen(this.favorite);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: selectedPageIndex,
        onTap: _selectedScreen,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  List<Map<String, Object>> _pages;
  int selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': "Categories"},
      {'page': Favorite(widget.favorite), 'title': "Favorites"},
    ];
    super.initState();
  }

  void _selectedScreen(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }
}
