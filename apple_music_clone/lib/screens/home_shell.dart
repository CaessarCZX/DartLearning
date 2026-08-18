import 'package:flutter/material.dart';
import '../player/mini_player.dart';
import '../theme/app_theme.dart';
import 'browse_screen.dart';
import 'library_screen.dart';
import 'listen_now_screen.dart';
import 'search_screen.dart';

/// Root shell that switches between a bottom navigation bar (compact widths)
/// and a navigation rail (wide widths) — the responsive core of the app.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  static const _destinations = [
    _NavItem('Listen Now', Icons.play_circle_fill_rounded),
    _NavItem('Browse', Icons.grid_view_rounded),
    _NavItem('Search', Icons.search_rounded),
    _NavItem('Library', Icons.library_music_rounded),
  ];

  Widget _screenFor(int i) {
    switch (i) {
      case 0:
        return const ListenNowScreen();
      case 1:
        return const BrowseScreen();
      case 2:
        return const SearchScreen();
      default:
        return const LibraryScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width >= 720;

    final body = IndexedStack(
      index: _index,
      children: List.generate(_destinations.length, _screenFor),
    );

    if (isWide) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              extended: width >= 1080,
              backgroundColor: AppColors.surface,
              selectedIndex: _index,
              onDestinationSelected: (i) => setState(() => _index = i),
              leading: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Icon(Icons.music_note_rounded,
                    color: AppColors.accent, size: 30),
              ),
              labelType: width >= 1080
                  ? NavigationRailLabelType.none
                  : NavigationRailLabelType.all,
              selectedIconTheme: const IconThemeData(color: AppColors.accent),
              selectedLabelTextStyle: const TextStyle(
                color: AppColors.accent,
                fontWeight: FontWeight.w600,
              ),
              destinations: [
                for (final d in _destinations)
                  NavigationRailDestination(
                    icon: Icon(d.icon),
                    label: Text(d.label),
                  ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: body),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: MiniPlayer(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Compact layout — bottom nav.
    return Scaffold(
      body: body,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: MiniPlayer(),
          ),
          NavigationBar(
            backgroundColor: AppColors.surface,
            selectedIndex: _index,
            onDestinationSelected: (i) => setState(() => _index = i),
            indicatorColor: AppColors.accent.withOpacity(0.15),
            destinations: [
              for (final d in _destinations)
                NavigationDestination(
                  icon: Icon(d.icon),
                  label: d.label,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  final String label;
  final IconData icon;
  const _NavItem(this.label, this.icon);
}
