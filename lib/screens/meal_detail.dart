import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends ConsumerWidget {
  final Meal meal;

  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref.read(favoriteMealsProvider.notifier).toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded ? 'Meal added as favorite' : 'Meal removed'),
                ),
              );
            },
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 14),
            Text(
              'Ingredients',
              style:
                  Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 14),
            Column(
              children: meal.ingredients
                  .map(
                    (meal) => Text(
                      meal,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 24),
            Text(
              'Steps',
              style:
                  Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 14),
            Column(
              children: meal.steps
                  .map(
                    (meal) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        meal,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
