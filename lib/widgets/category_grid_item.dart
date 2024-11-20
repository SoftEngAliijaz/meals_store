import 'package:flutter/material.dart';
import 'package:meals_store/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: InkWell(
        onTap: () {
          print('Tapped: ${category.title}');
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Text(category.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)),
        ),
      ),
    );
  }
}
