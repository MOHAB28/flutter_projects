import 'package:flutter/material.dart';

import 'package:yummy/models/food_category.dart';

class CategoryCard extends StatelessWidget {
  final FoodCategory foodCategory;
  const CategoryCard({super.key, required this.foodCategory});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme.apply(
      displayColor: Theme.of(context).colorScheme.onSurface, //
    );
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)), //
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10), //
                ),
                child: Image(image: AssetImage(foodCategory.imageUrl)), //
              ),
              Positioned(
                top: 16.0,
                left: 16.0,
                child: Text(
                  'Yummy',
                  style: textTheme.displayLarge, //
                ), //
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: RotatedBox(
                  quarterTurns: 1, //
                  child: Text('Yummy', style: textTheme.displayLarge),
                ),
              ),
            ],
          ), //
          ListTile(
            title: Text(foodCategory.name, style: textTheme.titleSmall), //
            subtitle: Text(
              '${foodCategory.numberOfRestaurants} places', //
              style: textTheme.bodySmall,
            ),
          ), //
        ],
      ),
    );
  }
}
