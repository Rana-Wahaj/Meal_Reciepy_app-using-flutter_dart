import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/widgets/gridview_item.dart';
import 'package:mealapp/screens/meal_screen.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/models/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key, required this.toggleMealFav, required this.filteredMeals});

  final void Function(Meal meal) toggleMealFav;
  final List<Meal> filteredMeals;

  void _selectedCategory(BuildContext context, Category category) {
    final filteredlist = filteredMeals
        .where(
          (meal) => meal.categories.contains(
            category.id,
          ),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          toggleMealFav: toggleMealFav,
          title: category.title,
          meals: filteredlist,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (final category in availableCategories)
          GridViewItems(
              category: category,
              onTap: () {
                _selectedCategory(context, category);
              }),
      ],
    );
  }
}
