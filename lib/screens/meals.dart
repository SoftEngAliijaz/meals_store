import 'package:flutter/material.dart';
import 'package:meals_store/models/meal.dart';
import 'package:meals_store/screens/meal_details.dart';
import 'package:meals_store/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    Key? key,
    this.title,
    required this.meals,
    required this.onToggleFavirote,
  }) : super(key: key);

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavirote;

  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MealDetailsScreen(
        meal: meal,
        onToggleFavirote: onToggleFavirote,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.no_food,
            size: 80,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          const Text(
            'No Meals Found',
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return MealItem(
            meal: meals[index],
            onTap: (meal) => selectMeal(meals[index], context),
          );
        },
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
