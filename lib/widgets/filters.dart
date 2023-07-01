import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/widgets/filter_item.dart';
import 'package:meal_app/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
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
      body: Column(
        children: [
          FilterItem(
            filterSet: activeFilters[Filters.glutenFree]!,
            title: "Gluten-free",
            subtitle: "only include gluten-free meals",
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.glutenFree, isChecked);
            },
          ),
          FilterItem(
            filterSet: activeFilters[Filters.lactoseFree]!,
            title: "Lactose-free",
            subtitle: "only include lactose-free meals",
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.lactoseFree, isChecked);
            },
          ),
          FilterItem(
            filterSet: activeFilters[Filters.vegetarian]!,
            title: "Vegetarian Meals",
            subtitle: "only include vegetarian meals",
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegetarian, isChecked);
            },
          ),
          FilterItem(
            filterSet: activeFilters[Filters.vegan]!,
            title: "Vegan Meals",
            subtitle: "only include vegan meals",
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegan, isChecked);
            },
          ),
        ],
      ),
    );
  }
}
