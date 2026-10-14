import 'package:flutter/material.dart';
import '../modelo/misiones.dart';
import '../services/progress_store.dart';
import '../theme.dart';

class QuizScreen extends StatefulWidget {
  final Mission mission;
  const QuizScreen({super.key, required this.mission});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _index = 0;
  int _score = 0;
  int? _selected;
  bool _finished = false;

  List<QuizQuestion> get _qs => widget.mission.questions;
  bool get _passed => _score * 2 >= _qs.length;

  void _answer(int i) {
    setState(() {
      _selected = i;
      if (i == _qs[_index].correct) _score++;
    });
  }

  void _next() {
    if (_index < _qs.length - 1) {
      setState(() {
        _index++;
        _selected = null;
      });
    } else {
      if (_passed) ProgressStore.instance.complete(widget.mission);
      setState(() => _finished = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.mission.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _finished ? _result() : _question(),
      ),
    );
  }

  Widget _question() {
    final q = _qs[_index];
    final answered = _selected != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: (_index + 1) / _qs.length,
          color: AppColors.lens,
          backgroundColor: Colors.white,
          minHeight: 8,
          borderRadius: BorderRadius.circular(8),
        ),
        const SizedBox(height: 8),
        Text('Reto ${_index + 1} de ${_qs.length}', style: const TextStyle(color: Colors.black54)),
        const SizedBox(height: 16),
        Text(q.question, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        const SizedBox(height: 20),
        for (var i = 0; i < q.options.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Material(
              color: !answered
                  ? Colors.white
                  : i == q.correct
                      ? AppColors.success.withValues(alpha: 0.2)
                      : i == _selected
                          ? AppColors.evidence.withValues(alpha: 0.2)
                          : Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: answered ? null : () => _answer(i),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(child: Text(q.options[i], style: const TextStyle(fontSize: 16))),
                      if (answered && i == q.correct)
                        const Icon(Icons.check_circle, color: AppColors.success),
                      if (answered && i == _selected && i != q.correct)
                        const Icon(Icons.cancel, color: AppColors.evidence),
                    ],
                  ),
                ),
              ),
            ),
          ),
        const Spacer(),
        if (answered) ...[
          Text(q.feedback, style: const TextStyle(fontSize: 15, height: 1.4)),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _next,
            child: Text(_index < _qs.length - 1 ? 'Siguiente reto' : 'Ver resultado'),
          ),
        ],
      ],
    );
  }

  Widget _result() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(_passed ? Icons.emoji_events : Icons.search_off,
            size: 96, color: _passed ? AppColors.lens : AppColors.evidence),
        const SizedBox(height: 16),
        Text(_passed ? 'Caso resuelto' : 'Pista incompleta',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Text('Acertaste $_score de ${_qs.length}.'
            '${_passed ? ' Ganaste ${widget.mission.xp} XP.' : ' Necesitas al menos la mitad para avanzar.'}',
            textAlign: TextAlign.center),
        const SizedBox(height: 32),
        FilledButton(
          onPressed: () => Navigator.pop(context, _passed),
          child: const Text('Volver al caso'),
        ),
      ],
    );
  }
}
