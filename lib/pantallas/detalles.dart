import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../modelo/misiones.dart';
import '../servicios/tienda_progreso.dart';
import '../tema.dart';
import 'quiz.dart';

class DetailScreen extends StatefulWidget {
  final Mission mission;
  const DetailScreen({super.key, required this.mission});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Mission get m => widget.mission;

  Future<void> _start() async {
    // El quiz devuelve true/false con Navigator.pop(context, aprobado).
    final passed = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => QuizScreen(mission: m)),
    );
    if (!mounted) return;
    if (passed == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Misión resuelta. +${m.xp} XP')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = ProgressStore.instance;
    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final locked = !store.isUnlocked(m);
        final done = store.isCompleted(m);
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 260,
                actions: [
                  IconButton(
                    tooltip: 'Favorito',
                    icon: Icon(store.isFavorite(m) ? Icons.favorite : Icons.favorite_border),
                    onPressed: () => store.toggleFavorite(m),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: 'mission-${m.id}',
                    child: Image.asset(m.image, fit: BoxFit.cover),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Text(m.category, style: const TextStyle(color: AppColors.teal, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(m.title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _Info(icon: Icons.bolt, label: '${m.xp} XP'),
                        _Info(icon: Icons.speed, label: m.difficultyLabel),
                        _Info(icon: Icons.timer_outlined, label: '${m.minutes} min'),
                        _Info(icon: Icons.quiz_outlined, label: '${m.questions.length} retos'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text('El caso', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    Text(m.story, style: const TextStyle(fontSize: 15, height: 1.5)),
                    const SizedBox(height: 24),
                    const Text('Evidencia', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.ink,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SelectableText(
                        m.code,
                        style: GoogleFonts.jetBrainsMono(color: Colors.white, fontSize: 13, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 28),
                    FilledButton.icon(
                      onPressed: locked ? null : _start,
                      icon: Icon(locked ? Icons.lock : Icons.play_arrow),
                      label: Text(locked
                          ? 'Completa la misión anterior'
                          : done ? 'Repetir misión' : 'Comenzar misión'),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Info extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Info({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.lens, size: 26),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
