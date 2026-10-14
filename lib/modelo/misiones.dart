class QuizQuestion {
  final String question;
  final List<String> options;
  final int correct;
  final String feedback;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correct,
    required this.feedback,
  });
}

class Mission {
  final String id;
  final String title;
  final String category;
  final String description;
  final String story;
  final String image;
  final String code;
  final int xp;
  final int difficulty; // 1 a 3
  final int minutes;
  final List<QuizQuestion> questions;

  const Mission({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.story,
    required this.image,
    required this.code,
    required this.xp,
    required this.difficulty,
    required this.minutes,
    required this.questions,
  });

  String get difficultyLabel => ['Fácil', 'Media', 'Difícil'][difficulty - 1];
}
