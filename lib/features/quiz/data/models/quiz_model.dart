class QuizModel {
  final String questionText;
  final String category;
  final List<String> options;
  final String correctAnswer;

  QuizModel({
    required this.questionText,
    required this.category,
    required this.options,
    required this.correctAnswer,
  });
}
