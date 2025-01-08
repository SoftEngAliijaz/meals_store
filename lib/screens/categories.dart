import 'package:flutter/material.dart';
import 'package:meals_store/data/dummy_data.dart';
import 'package:meals_store/models/category.dart';
import 'package:meals_store/screens/meals.dart';
import 'package:meals_store/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(
    BuildContext context,
    Category category,
  ) {
    final filterredMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    Navigator.push(context, MaterialPageRoute(builder: (v) {
      return MealsScreen(
        title: category.title,
        meals: filterredMeals,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2.5,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            onTap: () {
              _selectCategory(context, category);
            },
            category: category,
          ),
      ],
    );
  }
}
