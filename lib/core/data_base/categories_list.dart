import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/core/data_base/questions_lists.dart';
import 'package:quiz_app/core/utils/assets.dart';
import 'package:quiz_app/features/quiz/data/models/category_model.dart';

List<CategoryModel> categories = [
  CategoryModel(
      image: Assets.sports,
      recentResult: mainBox.put('Sports', 0),
      title: 'Sports',
      description:
          'A variety of physical activities that involve competition and skill.',
      questions: sportsQuestions),
  CategoryModel(
      image: Assets.science,
      recentResult: mainBox.put('Science', 0),
      title: 'Science',
      description:
          'The study of the natural world through observation and experimentation.',
      questions: scienceQuestions),
  CategoryModel(
      image: Assets.technology,
      recentResult: mainBox.put('Technology', 0),
      title: 'Technology',
      description:
          'The application of scientific knowledge for practical purposes in industry and life.',
      questions: technologyQuestions),
  CategoryModel(
      image: Assets.math,
      title: 'Math',
      recentResult: mainBox.put('Math', 0),
      description:
          'The study of numbers, quantities, shapes, and patterns used to solve problems.',
      questions: mathQuestions),
];
