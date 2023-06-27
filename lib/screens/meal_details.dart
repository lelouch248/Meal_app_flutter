import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({required this.meal, super.key});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: Column(
          children: [
            Image.network(meal.imageUrl),
          ],
        ));
  }
}
