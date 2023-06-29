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
    final isFavorite = ref.watch(favouriteMealsProvider).contains(meal);

    return IconButton(
      onPressed: () {
        ref
            .read(favouriteMealsProvider.notifier)
            .toggleMealFavouriteStatus(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isFavorite
                  ? '${meal.title} removed from favourites'
                  : '${meal.title} added to favourites',
            ),
            duration: const Duration(seconds: 3),
            shape: const StadiumBorder(),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: 'Dismiss',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      },
      icon: Icon(
        Icons.star,
        color: isFavorite ? Colors.yellow : Colors.grey,
      ),
    );
  }
}
