import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../player/player_controller.dart';
import '../widgets/cards.dart';
import '../widgets/section_header.dart';
import '../widgets/song_tile.dart';

class ListenNowScreen extends StatelessWidget {
  const ListenNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final player = PlayerScope.of(context);

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: _Header(title: 'Listen Now')),

        // Featured banners
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: MockData.featured.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (_, i) => FeatureCard(
                collection: MockData.featured[i],
                width: 300,
              ),
            ),
          ),
        ),

        // Made for you rail
        SliverToBoxAdapter(
          child: SectionHeader(title: 'Made for You', onSeeAll: () {}),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: MockData.madeForYou.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (_, i) => CollectionCard(
                collection: MockData.madeForYou[i],
              ),
            ),
          ),
        ),

        // Top songs
        SliverToBoxAdapter(
          child: SectionHeader(title: 'Top Songs', onSeeAll: () {}),
        ),
        SliverList.builder(
          itemCount: MockData.songs.length,
          itemBuilder: (context, i) {
            final song = MockData.songs[i];
            return AnimatedBuilder(
              animation: player,
              builder: (_, __) => SongTile(
                song: song,
                index: i,
                isPlaying: player.current == song,
                onTap: () => player.play(song),
              ),
            );
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  const _Header({required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
          ),
        ),
      ),
    );
  }
}
