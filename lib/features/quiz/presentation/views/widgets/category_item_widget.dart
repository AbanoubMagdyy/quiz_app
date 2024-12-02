import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/style/colors.dart';
import '../../../../../core/utils/style/text_styles.dart';
import '../../../data/models/category_model.dart';
import '../quiz_screen.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel categoryMotel;

  const CategoryItemWidget(this.categoryMotel, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => QuizScreen(categoryMotel))),
      child: Container(
        padding: const EdgeInsetsDirectional.all(10),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.primaryColor),
          borderRadius: BorderRadiusDirectional.circular(25),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.5),
                borderRadius: BorderRadiusDirectional.circular(25),
              ),
              child: Lottie.asset(categoryMotel.image),
            ),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryMotel.title,
                    style: AppTextStyles.textStyle24Bold,
                  ),
                  Text(
                    categoryMotel.description,
                    maxLines: 4,
                    style: AppTextStyles.textStyle18.copyWith(
                      color: Colors.brown,
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.question_mark_rounded),
                      Text('10 quizzes'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
