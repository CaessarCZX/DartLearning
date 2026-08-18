import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import 'artwork.dart';

/// Small square playlist/album card used in horizontal rails.
class CollectionCard extends StatelessWidget {
  final Collection collection;
  final double size;
  final VoidCallback? onTap;

  const CollectionCard({
    super.key,
    required this.collection,
    this.size = 150,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isFlexible = size == double.infinity;

    final artwork = isFlexible
        ? AspectRatio(
            aspectRatio: 1,
            child: Artwork(color: collection.color, size: double.infinity),
          )
        : Artwork(color: collection.color, size: size);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: isFlexible ? null : size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            artwork,
            const SizedBox(height: 8),
            Text(
              collection.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              collection.subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Large featured banner card.
class FeatureCard extends StatelessWidget {
  final Collection collection;
  final double width;
  final VoidCallback? onTap;

  const FeatureCard({
    super.key,
    required this.collection,
    this.width = 300,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              collection.color,
              Color.lerp(collection.color, Colors.black, 0.5) ??
                  collection.color,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              collection.subtitle.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w700,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              collection.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                height: 1.05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
