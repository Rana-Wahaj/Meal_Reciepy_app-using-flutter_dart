import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/screens/category_screen.dart';
import 'package:mealapp/screens/meal_screen.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/drawer_widget.dart';
import 'package:mealapp/screens/filters_screen.dart';

var myFilterData = {
  Filters.glutenFree: false,
  Filters.lactose: false,
  Filters.vegan: false,
  Filters.vegeterian: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int currIndex = 0;
  Map<Filters, bool> currFilters = myFilterData;

  final List<Meal> _favMeals = [];

  void onTappedDrawerItem(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      final res = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(
            updatedFilters: currFilters,
          ),
        ),
      );
      setState(() {
        currFilters = res ?? myFilterData;
      });
    }
  }

  void _favMealsToggle(Meal meal) {
    String message;
    ScaffoldMessenger.of(context).clearSnackBars();
    bool ifExistMeal = _favMeals.contains(meal);

    if (ifExistMeal) {
      setState(() {
        _favMeals.remove(meal);

        message = 'Meal Removed From Favorites!';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
            ),
          ),
        );
      });
    } else {
      setState(() {
        _favMeals.add(meal);

        message = 'Meal Added to Favorites!';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals.where((meal) {
      if (currFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (currFilters[Filters.lactose]! && !meal.isLactoseFree) {
        return false;
      }
      if (currFilters[Filters.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (currFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget currScreen = CategoryScreen(
      filteredMeals: filteredMeals,
      toggleMealFav: _favMealsToggle,
    );
    String title = 'Pick Category';

    if (currIndex == 1) {
      currScreen = MealScreen(
        meals: _favMeals,
        toggleMealFav: _favMealsToggle,
      );
      title = 'Your Favorites';
    }
    return Scaffold(
      drawer: DrawerContent(
        ontappedDrawerItem: onTappedDrawerItem,
      ),
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: currScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currIndex = index;
          });
        },
        currentIndex: currIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.food_bank_sharp,
              ),
              label: 'Category'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          )
        ],
      ),
    );
  }
}
