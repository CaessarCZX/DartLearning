import 'package:flutter/material.dart';
import '../models/models.dart';

/// A tiny playback state holder. No audio engine is wired here — this only
/// drives the UI. Swap the play/pause logic for `just_audio` or `audioplayers`
/// when you connect a real backend.
class PlayerController extends ChangeNotifier {
  Song? _current;
  bool _isPlaying = false;
  double _progress = 0.35; // 0..1 demo progress

  Song? get current => _current;
  bool get isPlaying => _isPlaying;
  double get progress => _progress;
  bool get hasSong => _current != null;

  void play(Song song) {
    _current = song;
    _isPlaying = true;
    _progress = 0.0;
    notifyListeners();
  }

  void togglePlay() {
    if (_current == null) return;
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void seek(double value) {
    _progress = value.clamp(0.0, 1.0);
    notifyListeners();
  }
}

/// Exposes a single PlayerController to the widget tree.
class PlayerScope extends InheritedNotifier<PlayerController> {
  const PlayerScope({
    super.key,
    required PlayerController controller,
    required super.child,
  }) : super(notifier: controller);

  static PlayerController of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<PlayerScope>();
    assert(scope != null, 'PlayerScope not found in widget tree');
    return scope!.notifier!;
  }
}
