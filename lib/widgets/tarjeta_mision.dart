import 'package:flutter/material.dart';
import '../modelo/misiones.dart';
import '../servicios/tienda_progreso.dart';
import '../tema.dart';

class MissionCard extends StatelessWidget {
  final Mission mission;
  final VoidCallback onTap;

  const MissionCard({super.key, required this.mission, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final store = ProgressStore.instance;
    final locked = !store.isUnlocked(mission);
    final done = store.isCompleted(mission);
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'mission-${mission.id}',
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(mission.image,
                        height: 105, width: double.infinity, fit: BoxFit.cover),
                  ),
                ),
                if (locked)
                  Positioned.fill(
                    child: Container(
                      color: AppColors.ink.withValues(alpha: 0.65),
                      child: const Icon(Icons.lock, color: Colors.white, size: 32),
                    ),
                  ),
                if (done)
                  const Positioned(
                    top: 8, right: 8,
                    child: CircleAvatar(
                      radius: 12, backgroundColor: AppColors.success,
                      child: Icon(Icons.check, size: 16, color: Colors.white),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mission.title,
                        maxLines: 2, overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                    const SizedBox(height: 4),
                    Text(mission.description,
                        maxLines: 2, overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12, color: Colors.black54)),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.bolt, size: 16, color: AppColors.lens),
                        Text('${mission.xp} XP',
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
