import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import '../widget/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  const CategoryMealsPage({Key key, @required this.availableMeals})
      : super(key: key);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  List<Meal> _categoryMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      _categoryMeals = widget.availableMeals
          .where(
            (meal) => meal.categories.contains(categoryId),
          )
          .toList();
      _loadedInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      _categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => MealItem(
            id: _categoryMeals[index].id,
            title: _categoryMeals[index].title,
            imageUrl: _categoryMeals[index].imageUrl,
            duration: _categoryMeals[index].duration,
            complexity: _categoryMeals[index].complexity,
            affordability: _categoryMeals[index].affordability,
          ),
          itemCount: _categoryMeals.length,
        ),
      ),
    );
  }
}
