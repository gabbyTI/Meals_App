import 'package:flutter/material.dart';
import '../widget/category_item.dart';

import '../dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (data) => CategoryItem(
              id: data.id,
              title: data.title,
              color: data.color,
            ),
          )
          .toList(),
    );
  }
}
