import 'package:flutter/material.dart';
import 'package:quiz_app/core/data_base/categories_list.dart';
import 'package:quiz_app/features/quiz/presentation/views/widgets/category_item_widget.dart';
import '../../../../core/utils/style/colors.dart';
import '../../../../core/utils/style/text_styles.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Categories'.toUpperCase(),
          style: AppTextStyles.textStyle20Bold
              .copyWith(color: AppColors.primaryColor),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) => CategoryItemWidget(
              categories[index],
            ),
          ),
        )
      ],
    );
  }
}
