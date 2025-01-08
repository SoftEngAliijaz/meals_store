import 'package:flutter/material.dart';
import 'package:meals_store/models/meal.dart';
import 'package:meals_store/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  /// Returns the complexity of the meal with the first letter capitalized.
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 5.0,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl.toString()),
              fit: BoxFit.cover,
              height: 250.0,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 44.0,
                  ),
                  child: Column(children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12.0),

                    ///metadata
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule_outlined,
                          lable: '${meal.duration} min',
                        ),
                        SizedBox(width: 10.0),
                        MealItemTrait(
                          icon: Icons.work_outline,
                          lable: '${complexityText}',
                        ),
                        SizedBox(width: 10.0),
                        MealItemTrait(
                          icon: Icons.attach_money_outlined,
                          lable: '${affordabilityText}',
                        ),
                      ],
                    ),
                  ]),
                )),
          ],
        ),
      ),
    );
  }
}
