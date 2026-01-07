import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _onSelectCategory(BuildContext context, Category category) {
    final List<Meal> meals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    print(meals.map((meal) => meal.title).join(', '));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MealsScreen(meals: meals, title: category.title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecciona la categoría')),
      body: GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: availableCategories
            .map(
              (category) =>
                  CategoryGridItem(category: category, onSelectCategory: () => _onSelectCategory(context, category)),
            )
            .toList(),
      ),
    );
  }
}
