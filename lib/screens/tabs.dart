import 'package:flutter/material.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/widgets/filters.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favourite_provider.dart';
import 'package:meal_app/providers/filter_provider.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = "categories";

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favouriteMealsProvider);
      setState(() {
        activePage = MealsScreen(meals: favoriteMeals);
        activePageTitle = 'Your Favorites';
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: Center(
        child: activePage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorites'),
        ],
      ),
    );
  }
}
