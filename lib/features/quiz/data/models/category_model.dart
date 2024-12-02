import 'package:quiz_app/features/quiz/data/models/quiz_model.dart';

class CategoryModel {
  final String title;
  final String description;
  final String image;
  final dynamic recentResult;
  final List<QuizModel> questions;

  CategoryModel({
    required this.title,
    required this.recentResult,
    required this.description,
    required this.image,
    required this.questions,
  });
}
