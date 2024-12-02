import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_app/core/constants/constants.dart';

import '../../../../../core/utils/style/colors.dart';
import '../../../../../core/utils/style/text_styles.dart';
import '../../../data/models/category_model.dart';

class ResentResultItemWidget extends StatelessWidget {
  final CategoryModel categoryMotel;

  const ResentResultItemWidget(this.categoryMotel, {super.key});

  @override
  Widget build(BuildContext context) {
    int? resentResult = mainBox.get(categoryMotel.title, defaultValue: 0);
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      height: 150,
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
                  '${categoryMotel.title} Quiz',
                  style: AppTextStyles.textStyle24Bold,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 8.0),
                      child: Text(
                        'Correct $resentResult/10',
                        style: AppTextStyles.textStyle18,
                      ),
                    ),
                    LinearPercentIndicator(
                      barRadius: const Radius.circular(10),
                      animation: true,
                      lineHeight: 20.0,
                      backgroundColor: AppColors.thirdColor.withOpacity(.3),
                      animationDuration: 800,
                      percent: resentResult! / 10,
                      progressColor: AppColors.thirdColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
