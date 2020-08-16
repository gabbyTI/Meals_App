import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail-page';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailPage(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final appBar = AppBar(
      title: Text('${selectedMeal.title}'),
    );

    ///A SizedBox widget with a height of 1% of screen height
    ///Used to give space
    final _space = SizedBox(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.01,
    );
    final _screenHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: _screenHeight * 0.25,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            _space,
            Expanded(
              // height: _screenHeight * 0.6,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSectionTile(context, 'Ingredients'),
                    // _space,
                    _buildContainer(
                      child: ListView.builder(
                        itemBuilder: (ctx, index) => Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              selectedMeal.ingredients[index],
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                        itemCount: selectedMeal.ingredients.length,
                      ),
                    ),
                    _buildSectionTile(context, 'Steps'),
                    _buildContainer(
                      child: ListView.builder(
                        itemBuilder: (ctx, index) => Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Text('#${index + 1}'),
                              ),
                              title: Text(
                                selectedMeal.steps[index],
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              indent: 70,
                            ),
                          ],
                        ),
                        itemCount: selectedMeal.steps.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavorite(mealId);
        },
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }

  Widget _buildSectionTile(BuildContext context, String title) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

  Widget _buildContainer({Widget child}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 160,
      // width: 300,
      child: child,
    );
  }
}
