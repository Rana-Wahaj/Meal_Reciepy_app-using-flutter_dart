import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_detail.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {super.key, required this.meal, required this.toggleMealFav});

  final Meal meal;
  final void Function(Meal meal) toggleMealFav;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        actions: [
          IconButton(
            onPressed: () {
              toggleMealFav(meal);
            },
            icon: const Icon(
              Icons.favorite,
            ),
          )
        ],
      ),
      body: MealDetail(meal: meal),
    );
  }
}
