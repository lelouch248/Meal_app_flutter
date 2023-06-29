import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs.dart';
import 'package:meal_app/widgets/filter_item.dart';
import 'package:meal_app/widgets/main_drawer.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});
  final Map<Filters, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filters.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filters.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filters.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == "meals") {
      //       Navigator.of(context)
      //           .push(MaterialPageRoute(builder: (ctx) => const TabScreen()));
      //     } else {
      //       Navigator.of(context).pop();
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(
            {
              Filters.glutenFree: _glutenFreeFilterSet,
              Filters.lactoseFree: _lactoseFreeFilterSet,
              Filters.vegetarian: _vegetarianFilterSet,
              Filters.vegan: _veganFilterSet,
            },
          );
          return false;
        },
        child: Column(
          children: [
            FilterItem(
              filterSet: _glutenFreeFilterSet,
              title: "Gluten-free",
              subtitle: "only include gluten-free meals",
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
            ),
            FilterItem(
              filterSet: _lactoseFreeFilterSet,
              title: "Lactose-free",
              subtitle: "only include lactose-free meals",
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
            ),
            FilterItem(
              filterSet: _vegetarianFilterSet,
              title: "Vegetarian Meals",
              subtitle: "only include vegetarian meals",
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
            ),
            FilterItem(
              filterSet: _veganFilterSet,
              title: "Vegan Meals",
              subtitle: "only include vegan meals",
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
