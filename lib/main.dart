import 'package:flutter/material.dart';
import 'package:meals_store/category_screen.dart';

void main() {
  runApp(const MyApp());
}
////Some minor changes to check commit

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals Store',
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
      home: const CategoryScreen(),
    );
  }
}
