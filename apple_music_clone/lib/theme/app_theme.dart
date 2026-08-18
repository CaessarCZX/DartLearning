import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Apple Music–inspired color palette + theme.
/// Palette is intentionally small: one brand accent + neutrals.
class AppColors {
  // Brand accent — Apple Music's signature pink/red.
  static const Color accent = Color(0xFFFA2D48);
  static const Color accentSoft = Color(0xFFFF5E7A);

  // Dark surfaces
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF1C1C1E);
  static const Color surfaceElevated = Color(0xFF2C2C2E);

  // Text neutrals
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF98989F);
  static const Color divider = Color(0xFF2A2A2C);
}

class AppTheme {
  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        secondary: AppColors.accentSoft,
        surface: AppColors.surface,
        onPrimary: Colors.white,
        onSurface: AppColors.textPrimary,
      ),
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
      dividerColor: AppColors.divider,
      splashColor: AppColors.accent.withOpacity(0.08),
      highlightColor: AppColors.accent.withOpacity(0.04),
    );
  }

  static const double radius = 12.0;
  static const double radiusLg = 18.0;
}
