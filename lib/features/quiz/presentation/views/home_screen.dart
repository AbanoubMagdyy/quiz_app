import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/style/colors.dart';
import 'package:quiz_app/core/utils/style/text_styles.dart';
import 'package:quiz_app/features/quiz/presentation/views/widgets/daily_quiz_item_widget.dart';
import 'package:quiz_app/features/quiz/presentation/views/widgets/recent_result_item_widget.dart';
import '../../../../core/data_base/categories_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DailyQuizItemWidget(),
        Text(
          'Recent Result',
          style: AppTextStyles.textStyle24Bold
              .copyWith(color: AppColors.thirdColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            itemBuilder: (context, index) => ResentResultItemWidget(
              categories[index],
            ),
          ),
        ),
      ],
    );
  }
}
