import 'package:flutter/material.dart';
import 'package:meals_store/data/dummy_data.dart';
import 'package:meals_store/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick your category')),
      body: GridView(
        padding: EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2.5,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category),
        ],
      ),
    );
  }
}
