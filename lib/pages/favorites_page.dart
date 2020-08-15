import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/widget/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesPage(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return !favoriteMeals.isEmpty
        ? Center(
            child: ListView.builder(
              itemBuilder: (context, index) => MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
              ),
              itemCount: favoriteMeals.length,
            ),
          )
        : Center(
            child: Text('You have no favorites...'),
          );
  }
}
