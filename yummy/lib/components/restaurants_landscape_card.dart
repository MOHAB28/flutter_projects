import 'package:flutter/material.dart';

import 'package:yummy/models/restaurant.dart';

class RestaurantLandscapeCard extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantLandscapeCard({super.key, required this.restaurant});

  @override
  State<RestaurantLandscapeCard> createState() =>
      _RestaurantLandscapeCardState();
}

class _RestaurantLandscapeCardState extends State<RestaurantLandscapeCard> {
  bool _isFav = false;

  void _changeFavStatus() {
    setState(() {
      _isFav = !_isFav;
    });
  }

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
            child: AspectRatio(
              aspectRatio: 2,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(widget.restaurant.imageUrl, fit: BoxFit.cover),
                  Positioned(
                    top: 4.0,
                    right: 4.0,
                    child: IconButton(
                      onPressed: _changeFavStatus,
                      icon: Icon(
                        _isFav ? Icons.favorite : Icons.favorite_border,
                        size: 30.0,
                        color: Colors.red[400],
                      ), //
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(widget.restaurant.name, style: textTheme.titleSmall),
            subtitle: Text(
              widget.restaurant.attributes,
              style: textTheme.bodySmall, //
            ),
          ),
        ],
      ),
    );
  }
}
