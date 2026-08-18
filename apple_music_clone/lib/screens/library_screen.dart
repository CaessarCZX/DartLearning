import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';
import '../widgets/cards.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Text(
                'Library',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                ),
              ),
            ),
          ),
        ),

        // Quick filters
        SliverList.builder(
          itemCount: MockData.libraryItems.length,
          itemBuilder: (_, i) => Column(
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                leading: Icon(_iconFor(i), color: AppColors.accent),
                title: Text(
                  MockData.libraryItems[i],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right,
                    color: AppColors.textSecondary),
                onTap: () {},
              ),
              const Divider(height: 1, indent: 20, endIndent: 20),
            ],
          ),
        ),

        // Recently added grid
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
            child: Text(
              'Recently Added',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverLayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.crossAxisExtent;
              final cols = width > 900
                  ? 4
                  : width > 600
                      ? 3
                      : 2;
              return SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.78,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, i) => CollectionCard(
                    collection: MockData.madeForYou[
                        i % MockData.madeForYou.length],
                    size: double.infinity,
                  ),
                  childCount: 6,
                ),
              );
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }

  IconData _iconFor(int i) {
    switch (i) {
      case 0:
        return Icons.queue_music_rounded;
      case 1:
        return Icons.mic_external_on_rounded;
      case 2:
        return Icons.album_rounded;
      case 3:
        return Icons.music_note_rounded;
      default:
        return Icons.download_rounded;
    }
  }
}
