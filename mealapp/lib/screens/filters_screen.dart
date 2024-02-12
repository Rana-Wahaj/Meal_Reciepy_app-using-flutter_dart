import 'package:flutter/material.dart';

enum Filters { glutenFree, lactose, vegeterian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.updatedFilters});
  final Map<Filters, bool> updatedFilters;
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegeterian = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();
    _vegan = widget.updatedFilters[Filters.vegan]!;
    _vegeterian = widget.updatedFilters[Filters.vegeterian]!;
    _glutenFree = widget.updatedFilters[Filters.glutenFree]!;
    _lactoseFree = widget.updatedFilters[Filters.lactose]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.glutenFree: _glutenFree,
            Filters.lactose: _lactoseFree,
            Filters.vegeterian: _vegeterian,
            Filters.vegan: _vegan
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFree,
              onChanged: (ischecked) {
                setState(() {
                  _glutenFree = ischecked;
                });
              },
              title: Text(
                'Gluten-Free Meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Include Only Gluten-Free Meals',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 20, left: 20),
            ),
            SwitchListTile(
              value: _lactoseFree,
              onChanged: (ischecked) {
                setState(() {
                  _lactoseFree = ischecked;
                });
              },
              title: Text(
                'Lactose-Free Meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Include Only Lactose-Free Meals',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 20, left: 20),
            ),
            SwitchListTile(
              value: _vegeterian,
              onChanged: (ischecked) {
                setState(() {
                  _vegeterian = ischecked;
                });
              },
              title: Text(
                'Vegeterian Meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Include Only Vegeterian Meals',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 20, left: 20),
            ),
            SwitchListTile(
              value: _vegan,
              onChanged: (ischecked) {
                setState(() {
                  _vegan = ischecked;
                });
              },
              title: Text(
                'Vegan Meals',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Include Only Vegan Meals',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 20, left: 20),
            ),
          ],
        ),
      ),
    );
  }
}
