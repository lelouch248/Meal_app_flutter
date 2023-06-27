import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';
import 'package:meal_app/screens/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key, required this.id, required this.title, required this.meals});
  final String id;
  final String title;
  final List<Meal> meals;

  void _onSelectMealItem(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealDetailScreen(
            meal: meal,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onSelectedMealItem: () {
                _onSelectMealItem(context, meals[index]);
              },
            ));

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.warning,
                ),
                Text(
                  ' uh oh .... Nothing here',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Try selecting another category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);
  }
}
