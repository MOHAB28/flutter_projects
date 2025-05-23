import 'package:flutter/material.dart';
import 'package:yummy/constants.dart';

class HomeView extends StatelessWidget {
  final VoidCallback changeTheme;
  final void Function(int index) colorSchemeSeedChange;
  final ColorSelection colorSelected;
  const HomeView({
    super.key,
    required this.changeTheme,
    required this.colorSchemeSeedChange,
    required this.colorSelected,
  });

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        title: Text('Yummy'),
        actions: [
          IconButton(
            onPressed: changeTheme,
            icon: Icon(isLight ? Icons.dark_mode : Icons.light_mode), //
          ),
          PopupMenuButton(
            icon: Icon(Icons.opacity_outlined),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            itemBuilder: (_) {
              return List.generate(
                ColorSelection.values.length,
                (index) {
                  // red == blue -> false
                  // blue <- blue true
                  // green
                  final currentColor = ColorSelection.values[index];
                  return PopupMenuItem(
                    value: index,
                    enabled: currentColor != colorSelected,
                    child: Row(
                      spacing: 20.0,
                      children: [
                        Icon(Icons.opacity_outlined, color: currentColor.color),
                        Text(currentColor.label),
                      ],
                    ),
                  );
                }, //
              );
            },
            onSelected: colorSchemeSeedChange,
          ),
        ],
      ), //
    );
  }
}
