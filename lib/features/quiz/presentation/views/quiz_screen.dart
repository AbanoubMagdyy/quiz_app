import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz/data/models/category_model.dart';
import 'package:quiz_app/features/quiz/presentation/views/quiz_screen_body.dart';
import '../../../../core/utils/style/colors.dart';

class QuizScreen extends StatelessWidget {
  final CategoryModel categoryModel;

  const QuizScreen(
    this.categoryModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios_rounded),
        title: Text(categoryModel.title),
        centerTitle: true,
      ),
      body: QuizScreenBody(categoryModel.questions),
    );
  }
}
