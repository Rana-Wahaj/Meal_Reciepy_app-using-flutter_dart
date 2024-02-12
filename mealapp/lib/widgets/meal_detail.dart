import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              clipBehavior: Clip.hardEdge,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Ingredients',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 179, 199)),
            ),
            const SizedBox(
              height: 6,
            ),
            for (final ingredient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  ingredient,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Procedure To Follow',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 179, 199)),
            ),
            const SizedBox(
              height: 6,
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  step,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
