import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A gradient artwork placeholder with a subtle music glyph.
/// Swap this for Image.network when you wire real artwork URLs.
class Artwork extends StatelessWidget {
  final Color color;
  final double size;
  final double radius;

  const Artwork({
    super.key,
    required this.color,
    this.size = 160,
    this.radius = AppTheme.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            Color.lerp(color, Colors.black, 0.45) ?? color,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.25),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final side = constraints.biggest.shortestSide;
          final glyph = side.isFinite ? side * 0.32 : 48.0;
          return Icon(
            Icons.music_note_rounded,
            color: Colors.white.withOpacity(0.35),
            size: glyph,
          );
        },
      ),
    );
  }
}
