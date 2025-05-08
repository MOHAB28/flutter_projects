import 'package:flutter/material.dart';

typedef ChangeThemeModeCallBack = void Function(bool useLightMode);

class ThemeButton extends StatelessWidget {
  final ChangeThemeModeCallBack changeTheme;
  const ThemeButton({
    super.key, //
    required this.changeTheme,
  });

  @override
  Widget build(BuildContext context) {
    bool isBright = Theme.of(context).brightness == Brightness.light;
    return IconButton(
      icon:
          isBright
              ? const Icon(Icons.dark_mode_outlined)
              : const Icon(Icons.light_mode_outlined),
      onPressed: () => changeTheme(!isBright), //
    );
  }
}
