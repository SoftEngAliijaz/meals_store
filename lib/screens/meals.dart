import 'package:flutter/material.dart';
import 'package:meals_store/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    Key? key,
    required this.meals,
    required this.title,
  }) : super(key: key);

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            'No Data Found',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );

    if (meals.isNotEmpty) {
      return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return Card(
            child: Text(
              meals[index].title,
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
