import 'package:flutter/material.dart';

import 'package:yummy/components/color_button.dart';

import 'package:yummy/components/theme_button.dart';
import 'package:yummy/constants.dart';
import 'package:yummy/screens/account_view.dart';
import 'package:yummy/screens/explore_view.dart';
import 'package:yummy/screens/order_view.dart';

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
      icon: Icon(Icons.home_outlined),
      label: 'Home',
      selectedIcon: Icon(Icons.home),
    ),
    NavigationDestination(
      icon: Icon(Icons.list_outlined),
      label: 'Orders',
      selectedIcon: Icon(Icons.list),
    ),
    NavigationDestination(
      icon: Icon(Icons.person_2_outlined),
      label: 'Account',
      selectedIcon: Icon(Icons.person),
    ),
  ];

  final List<Widget> _pages = [
    ExploreView(),
    const OrderView(),
    const AccountView(),
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
