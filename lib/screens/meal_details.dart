import 'package:flutter/material.dart';
import 'package:meals_store/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    Key? key,
    required this.meal,
    required this.onToggleFavirote,
  }) : super(key: key);

  final Meal meal;
  final void Function(Meal meal) onToggleFavirote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavirote(meal);
            },
            icon: const Icon(Icons.star_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Meal Image
            Stack(
              children: [
                Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Ingredients Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(title: 'Ingredients'),
                  const SizedBox(height: 10.0),
                  ...meal.ingredients.map(
                    (ingredient) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ingredient,
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Steps Section
                  SectionTitle(title: 'Steps'),
                  const SizedBox(height: 10.0),
                  ...meal.steps.map(
                    (step) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text(
                            '${meal.steps.indexOf(step) + 1}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          step,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
