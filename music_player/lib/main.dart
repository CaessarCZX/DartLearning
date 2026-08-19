import 'package:flutter/material.dart';
import 'package:music_player/presentation/screeen/home/home_screen.dart';

void main() => runApp(const MusicApp());

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home' : (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      );
  }
}
