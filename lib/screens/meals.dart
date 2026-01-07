import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_list_item.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  const MealsScreen({super.key, required this.meals, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(height: 8);
        },
        itemCount: meals.length,
        itemBuilder: (_, index) {
          final currentItem = meals[index];
          return meals.isNotEmpty
              ? MealListItem(meal: currentItem)
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'No hay elementos que mostrar',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.surface),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Prueba seleccionar otra categoría',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.surface),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
