// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:yummy/components/category_card.dart';
import 'package:yummy/components/color_button.dart';
import 'package:yummy/components/post_card.dart';
import 'package:yummy/components/restaurants_landscape_card.dart';
import 'package:yummy/components/theme_button.dart';
import 'package:yummy/constants.dart';
import 'package:yummy/models/food_category.dart';
import 'package:yummy/models/post.dart';
import 'package:yummy/models/restaurant.dart';

class HomePage extends StatefulWidget {
  final ChangeThemeModeCallBack changeThemeModeCallBack;
  final ChangeColorCallBack changeColorCallBack;
  final String title;
  final ColorSelection colorSelected;

  const HomePage({
    super.key,
    required this.changeThemeModeCallBack,
    required this.changeColorCallBack,
    required this.title,
    required this.colorSelected,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTap = 0;

  void _changeCurrentTap(int index) {
    setState(() {
      _currentTap = index;
    });
  }

  final List<NavigationDestination> _appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Category',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Post',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Restaurant',
      selectedIcon: Icon(Icons.credit_card),
    ),
  ];

  final List<Widget> _pages = [
    CategoryView(foodCategory: categories.first),
    PostsView(post: posts.first),
    RestaurantsView(restaurant: restaurants.first),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          widget.title, //
        ),
        actions: [
          ThemeButton(
            changeTheme: widget.changeThemeModeCallBack, //
          ),
          ColorButton(
            changeColor: widget.changeColorCallBack,
            colorSelected: widget.colorSelected, //
          ),
        ],
      ), //
      body: IndexedStack(index: _currentTap, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTap,
        onDestinationSelected: _changeCurrentTap,
        destinations: _appBarDestinations, //
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  final FoodCategory foodCategory;
  const CategoryView({super.key, required this.foodCategory});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300.0),
        child: CategoryCard(foodCategory: foodCategory), //
      ), //
    );
  }
}

class PostsView extends StatelessWidget {
  final Post post;
  const PostsView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Center(child: PostCard(post: post));
  }
}

class RestaurantsView extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantsView({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Center(child: RestaurantLandscapeCard(restaurant: restaurant));
  }
}
