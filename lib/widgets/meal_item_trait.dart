import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    Key? key,
    required this.icon,
    required this.lable,
  }) : super(key: key);

  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17.0, color: Colors.white),
        SizedBox(width: 10.0),
        Text(
          lable,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
