import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/style/colors.dart';
import '../../../../../core/utils/style/text_styles.dart';

class DailyQuizItemWidget extends StatelessWidget {
  const DailyQuizItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(25),
        image: const DecorationImage(
          image: AssetImage(Assets.brownBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 70,
            lineWidth: 3.0,
            animation: true,
            percent: .0,
            center: Text(
              '0%',
              style: AppTextStyles.textStyle24Bold,
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: AppColors.thirdColor,
            backgroundColor: AppColors.secondaryColor,
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Daily Quiz',
                style: AppTextStyles.textStyle24Bold,
              ),
              Text(
                '10 Questions',
                style: AppTextStyles.textStyle18.copyWith(color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            size: 25,
            Icons.arrow_forward_ios_outlined,
            color: AppColors.secondaryColor,
          ),
        ],
      ),
    );
  }
}
