import 'package:flutter/material.dart';

/// A single track.
class Song {
  final String title;
  final String artist;
  final String album;
  final Duration duration;
  final Color color; // used for artwork gradient placeholder

  const Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    required this.color,
  });
}

/// An album / playlist card entry.
class Collection {
  final String title;
  final String subtitle;
  final Color color;
  final List<Song> songs;

  const Collection({
    required this.title,
    required this.subtitle,
    required this.color,
    this.songs = const [],
  });
}
