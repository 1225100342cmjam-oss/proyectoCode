import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/mock_misiones.dart';
import '../modelo/misiones.dart';

/// Guarda el progreso del jugador con shared_preferences.
class ProgressStore extends ChangeNotifier {
  static final ProgressStore instance = ProgressStore._();
  ProgressStore._();

  final Set<String> _completed = {};
  final Set<String> _favorites = {};
  int _xp = 0;
  SharedPreferences? _prefs;

  int get xp => _xp;
  int get level => _xp ~/ 100 + 1;
  double get levelProgress => (_xp % 100) / 100;
  int get completedCount => _completed.length;

  Future<void> load() async {
    final p = _prefs = await SharedPreferences.getInstance();
    _completed.addAll(p.getStringList('completed') ?? []);
    _favorites.addAll(p.getStringList('favorites') ?? []);
    _xp = p.getInt('xp') ?? 0;
    notifyListeners();
  }

  bool isCompleted(Mission m) => _completed.contains(m.id);
  bool isFavorite(Mission m) => _favorites.contains(m.id);

  /// Una misión se desbloquea al completar la anterior.
  bool isUnlocked(Mission m) {
    final i = missions.indexWhere((e) => e.id == m.id);
    return i <= 0 || _completed.contains(missions[i - 1].id);
  }

  Future<void> complete(Mission m) async {
    if (!_completed.add(m.id)) return;
    _xp += m.xp;
    await _save();
  }

  Future<void> toggleFavorite(Mission m) async {
    if (!_favorites.remove(m.id)) _favorites.add(m.id);
    await _save();
  }

  Future<void> reset() async {
    _completed.clear();
    _favorites.clear();
    _xp = 0;
    await _save();
  }

  Future<void> _save() async {
    notifyListeners();
    final p = _prefs;
    if (p == null) return;
    await p.setStringList('completed', _completed.toList());
    await p.setStringList('favorites', _favorites.toList());
    await p.setInt('xp', _xp);
  }
}
