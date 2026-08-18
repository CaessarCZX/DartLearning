import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/artwork.dart';
import 'player_controller.dart';

/// Full-screen "Now Playing" sheet, opened from the mini player.
class NowPlayingSheet extends StatelessWidget {
  const NowPlayingSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => PlayerScope(
        controller: PlayerScope.of(context),
        child: const NowPlayingSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final player = PlayerScope.of(context);

    return AnimatedBuilder(
      animation: player,
      builder: (context, _) {
        final song = player.current;
        if (song == null) return const SizedBox.shrink();

        return Container(
          height: MediaQuery.of(context).size.height * 0.92,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.lerp(song.color, Colors.black, 0.25) ?? song.color,
                Colors.black,
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const Spacer(),
                  Artwork(
                    color: song.color,
                    size: MediaQuery.of(context).size.width.clamp(0, 420) - 56,
                    radius: 16,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              song.artist,
                              style: const TextStyle(
                                fontSize: 20,
                                color: AppColors.accentSoft,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz, size: 28),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _ProgressBar(player: player, song: song),
                  const SizedBox(height: 24),
                  _Controls(player: player),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final PlayerController player;
  final dynamic song;
  const _ProgressBar({required this.player, required this.song});

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60).toString();
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final total = song.duration as Duration;
    final elapsed = total * player.progress;
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.white.withOpacity(0.2),
            thumbColor: Colors.white,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
          ),
          child: Slider(
            value: player.progress,
            onChanged: player.seek,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_fmt(elapsed),
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.textSecondary)),
              Text('-${_fmt(total - elapsed)}',
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
        ),
      ],
    );
  }
}

class _Controls extends StatelessWidget {
  final PlayerController player;
  const _Controls({required this.player});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.skip_previous_rounded, size: 44),
        GestureDetector(
          onTap: player.togglePlay,
          child: Icon(
            player.isPlaying
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
            size: 68,
          ),
        ),
        const Icon(Icons.skip_next_rounded, size: 44),
      ],
    );
  }
}
