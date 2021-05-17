import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../widgets/main_drawer.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text(_pages[selectedPageIndex]['title']),) ,
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: selectedPageIndex,
        onTap: _selectedScreen,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "Favorites"),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
  final List<Map<String, Object>> _pages=[
    {'page':CategoriesScreen(),
      'title':"Categories"
    },
    {'page':Favorite(),
      'title':"Favorites"},
  ];
  int selectedPageIndex=0;
  void _selectedScreen(int value) {
    setState(() {
      selectedPageIndex=value;
    });
  }
}
