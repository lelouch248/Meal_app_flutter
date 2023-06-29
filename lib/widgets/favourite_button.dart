import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favourite_provider.dart';

class FavouriteIconButton extends ConsumerWidget {
  const FavouriteIconButton({
    required this.meal,
    Key? key,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.read(favouriteMealsProvider.notifier).toggleMealFavouriteStatus(meal);
      },
      icon: const Icon(Icons.star),
    );
  }
}
