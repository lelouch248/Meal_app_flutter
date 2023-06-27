import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton(
      {required this.meal, required this.onToggleFavourite, super.key});
  final void Function(Meal meal) onToggleFavourite;
  final Meal meal;

  @override
  State<FavouriteIconButton> createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  Color onPressColorFav = Colors.white;
  bool onToggle = false;

  void _onselectfavourite() {
    widget.onToggleFavourite(widget.meal);
    if (onToggle) {
      setState(() {
        onPressColorFav = Colors.white;
        onToggle = false;
      });
    } else {
      setState(() {
        onPressColorFav = Colors.yellow;
        onToggle = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _onselectfavourite,
      icon: const Icon(Icons.star),
      color: onPressColorFav,
    );
  }
}
