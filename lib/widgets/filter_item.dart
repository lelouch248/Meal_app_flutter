import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(
      {super.key,
      required this.filterSet,
      required this.title,
      required this.subtitle,
      required this.onChanged});
  final bool filterSet;
  final String title;
  final String subtitle;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterSet,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
