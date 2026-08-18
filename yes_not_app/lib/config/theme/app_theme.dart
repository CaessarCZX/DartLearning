import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

final variantCounter = _colorTheme.length - 1;

class AppTheme {
  final int selectedColor;

  AppTheme({ required this.selectedColor })
    : assert(
        selectedColor >= 0 && selectedColor <= variantCounter,
        'Colors must be between 0 and $variantCounter',
      );

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorTheme[selectedColor],
      // brightness: Brightness.dark,
    );
  }
}
