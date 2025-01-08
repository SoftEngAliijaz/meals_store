import 'package:flutter/material.dart';
import 'package:meals_store/models/meal.dart';
import 'package:meals_store/screens/categories.dart';
import 'package:meals_store/screens/meals.dart';

class TabsViewScreen extends StatefulWidget {
  const TabsViewScreen({Key? key}) : super(key: key);

  @override
  State<TabsViewScreen> createState() => _TabsViewScreenState();
}

class _TabsViewScreenState extends State<TabsViewScreen> {
  int selectedPageIndex = 0;
  final List<Meal> _favMeals = [];

  void _toggleMealFaviroteStatus(Meal meal) {
    final isExisting = _favMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favMeals.remove(meal);
      });
    } else {
      setState(() {
        _favMeals.add(meal);
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =
        CategoriesScreen(onToggleFavirote: _toggleMealFaviroteStatus);
    var activePageTitle = 'Pick your category';

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: [],
        onToggleFavirote: _toggleMealFaviroteStatus,
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
