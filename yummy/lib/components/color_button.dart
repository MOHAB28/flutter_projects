import 'package:flutter/material.dart';
import 'package:yummy/constants.dart';

typedef ChangeColorCallBack = void Function(int index);

class ColorButton extends StatelessWidget {
  const ColorButton({
    super.key,
    required this.changeColor,
    required this.colorSelected,
  });

  final ChangeColorCallBack changeColor;
  final ColorSelection colorSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.opacity_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return List.generate(
          ColorSelection.values.length,
          (index) {
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
      onSelected: changeColor,
    );
  }
}
