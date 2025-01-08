import 'package:flutter/material.dart';
import 'package:meals_store/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 250.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  ...meal.ingredients.map((ingredient) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          ingredient,
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Text(
                    'Steps',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  ...meal.steps.map((step) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          step,
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
