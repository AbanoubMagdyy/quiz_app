import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/style/colors.dart';
import '../../../../../core/utils/style/text_styles.dart';
import '../../view_model/app_cubit/app_cubit.dart';

class QuizAppBarWidget extends StatelessWidget {
  const QuizAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Hi 👋,\n$userName'.toUpperCase(),
            style: AppTextStyles.textStyle20Bold
                .copyWith(color: AppColors.secondaryColor),
          ),
        ),
        const Icon(
          Icons.emoji_events,
          color: Colors.yellow,
          size: 35,
        ),
        const SizedBox(
          width: 10,
        ),
        BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return CircularPercentIndicator(
              radius: 32,
              lineWidth: 3.0,
              animation: true,
              percent: cubit.points / 200,
              center: Text(
                cubit.points.toString(),
                style: AppTextStyles.textStyle24Bold
                    .copyWith(color: AppColors.thirdColor),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: AppColors.thirdColor,
              backgroundColor: AppColors.secondaryColor,
            );
          },
        ),
      ],
    );
  }
}
