import 'package:flutter/material.dart';
import '../../../../../core/utils/style/colors.dart';
import '../../../../../core/utils/style/text_styles.dart';
import '../../../data/models/quiz_model.dart';
import 'choose_item_widget.dart';

class QuizItemWidget extends StatelessWidget {
  final QuizModel quizModel;

  const QuizItemWidget(this.quizModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quizModel.questionText,
          style: AppTextStyles.textStyle24Bold
              .copyWith(color: AppColors.thirdColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: quizModel.options.length,
            itemBuilder: (context, index) => ChooseItemWidget(
              category: quizModel.category,
              choose: quizModel.options[index],
              correctAnswer: quizModel.correctAnswer,
            ),
          ),
        ),
      ],
    );
  }
}
