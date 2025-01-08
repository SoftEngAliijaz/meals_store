import 'package:flutter/material.dart';
import 'package:meals_store/screens/categories.dart';
import 'package:meals_store/screens/meals.dart';

class TabsViewScreen extends StatefulWidget {
  const TabsViewScreen({Key? key}) : super(key: key);

  @override
  State<TabsViewScreen> createState() => _TabsViewScreenState();
}

class _TabsViewScreenState extends State<TabsViewScreen> {
  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen();
    var activePageTitle = 'Pick your category';

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: [],
      );
      activePageTitle = 'Favirotes';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: selectedPageIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal_outlined), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_outline), label: 'Favorite'),
        ],
      ),
      body: activePage,
    );
  }
}
