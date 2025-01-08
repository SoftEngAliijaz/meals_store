import 'package:flutter/material.dart';
import 'package:meals_store/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Image(
        image: NetworkImage(meal.imageUrl),
        width: double.infinity,
        height: 250.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
