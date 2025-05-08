import 'package:flutter/material.dart';

import 'package:yummy/models/restaurant.dart';

class RestaurantLandscapeCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantLandscapeCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme.apply(
      displayColor: Theme.of(context).colorScheme.onSurface, //
    );

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)), //
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image(
              image: AssetImage(restaurant.imageUrl), //
            ), //
          ),
          ListTile(
            title: Text(restaurant.name, style: textTheme.titleSmall),
            subtitle: Text(
              restaurant.attributes,
              style: textTheme.bodySmall, //
            ),
          ),
        ],
      ),
    );
  }
}
