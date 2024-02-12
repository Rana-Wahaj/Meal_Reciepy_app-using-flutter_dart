import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key, required this.ontappedDrawerItem});

  final void Function(String identifier) ontappedDrawerItem;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.5)
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.restaurant,
                  size: 40,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dinner_dining),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20),
            ),
            onTap: () {
              ontappedDrawerItem('meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20),
            ),
            onTap: () {
              ontappedDrawerItem('filter');
            },
          )
        ],
      ),
    );
  }
}
