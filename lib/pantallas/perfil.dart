import 'package:flutter/material.dart';
import '../data/mock_misiones.dart';
import '../servicios/progress_store.dart';
import '../tema.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _badges = [
    (1, 'Primer caso', Icons.flag),
    (3, 'Investigador', Icons.search),
    (5, 'Detective', Icons.psychology),
    (8, 'Maestro del misterio', Icons.workspace_premium),
  ];

  @override
  Widget build(BuildContext context) {
    final s = ProgressStore.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil del detective')),
      body: ListenableBuilder(
        listenable: s,
        builder: (_, __) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text('Nivel ${s.level}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: s.levelProgress, minHeight: 10, color: AppColors.lens,
              backgroundColor: Colors.white, borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(height: 8),
            Text('${s.xp} XP · ${s.completedCount} de ${missions.length} misiones resueltas'),
            const SizedBox(height: 28),
            const Text('Insignias', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            for (final b in _badges)
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: s.completedCount >= b.$1 ? AppColors.lens : Colors.black12,
                    child: Icon(b.$3, color: AppColors.ink),
                  ),
                  title: Text(b.$2),
                  subtitle: Text('Resuelve ${b.$1} ${b.$1 == 1 ? 'misión' : 'misiones'}'),
                  trailing: s.completedCount >= b.$1
                      ? const Icon(Icons.check_circle, color: AppColors.success)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => s.reset(),
              child: const Text('Reiniciar progreso'),
            ),
          ],
        ),
      ),
    );
  }
}
