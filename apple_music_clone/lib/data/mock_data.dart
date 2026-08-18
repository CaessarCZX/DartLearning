import 'package:flutter/material.dart';
import '../models/models.dart';

/// Static demo content so the UI has something to render.
class MockData {
  static const List<Song> songs = [
    Song(
      title: 'Midnight City',
      artist: 'Lunar Drive',
      album: 'Neon Skyline',
      duration: Duration(minutes: 4, seconds: 3),
      color: Color(0xFFEC4899),
    ),
    Song(
      title: 'Golden Hour',
      artist: 'Coastline',
      album: 'Warm Static',
      duration: Duration(minutes: 3, seconds: 47),
      color: Color(0xFFF59E0B),
    ),
    Song(
      title: 'Deep End',
      artist: 'Marlowe',
      album: 'Undertow',
      duration: Duration(minutes: 5, seconds: 12),
      color: Color(0xFF3B82F6),
    ),
    Song(
      title: 'Paper Planes',
      artist: 'The Verandas',
      album: 'Rooftops',
      duration: Duration(minutes: 3, seconds: 21),
      color: Color(0xFF10B981),
    ),
    Song(
      title: 'Slow Motion',
      artist: 'Ivory Keys',
      album: 'After Dark',
      duration: Duration(minutes: 4, seconds: 38),
      color: Color(0xFF8B5CF6),
    ),
    Song(
      title: 'Static Bloom',
      artist: 'Halcyon',
      album: 'Bloom',
      duration: Duration(minutes: 4, seconds: 1),
      color: Color(0xFFEF4444),
    ),
  ];

  static const List<Collection> featured = [
    Collection(
      title: 'New Music Daily',
      subtitle: 'Updated every day',
      color: Color(0xFFFA2D48),
    ),
    Collection(
      title: 'Chill Mix',
      subtitle: 'Made for you',
      color: Color(0xFF6366F1),
    ),
    Collection(
      title: 'Today\'s Hits',
      subtitle: 'The biggest songs',
      color: Color(0xFF0EA5E9),
    ),
  ];

  static const List<Collection> madeForYou = [
    Collection(title: 'Focus', subtitle: 'Playlist', color: Color(0xFF14B8A6)),
    Collection(title: 'Late Night', subtitle: 'Playlist', color: Color(0xFF7C3AED)),
    Collection(title: 'Throwback', subtitle: 'Playlist', color: Color(0xFFF97316)),
    Collection(title: 'Workout', subtitle: 'Playlist', color: Color(0xFFDC2626)),
    Collection(title: 'Acoustic', subtitle: 'Playlist', color: Color(0xFFCA8A04)),
  ];

  static const List<String> genres = [
    'Pop', 'Hip-Hop', 'R&B', 'Rock', 'Electronic',
    'Jazz', 'Classical', 'Indie', 'Country', 'Lo-Fi',
  ];

  static const List<String> libraryItems = [
    'Playlists', 'Artists', 'Albums', 'Songs', 'Downloaded',
  ];
}
