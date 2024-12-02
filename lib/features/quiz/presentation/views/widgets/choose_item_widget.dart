import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/style/colors.dart';
import '../../../../../core/utils/style/text_styles.dart';
import '../../view_model/app_cubit/app_cubit.dart';

class ChooseItemWidget extends StatelessWidget {
  final String choose;
  final String correctAnswer;
  final String category;
  const ChooseItemWidget(
      {required this.choose,
      required this.category,
      required this.correctAnswer,
      super.key});

  @override
  Widget build(BuildContext context) {
    bool isCorrect = false;
    bool didTheUserClick = false;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is CheckTheAnswer) {
          if (choose == correctAnswer) {
            isCorrect = true;
          } else {
            isCorrect = false;
          }
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            AppCubit.get(context).checkTheAnswer(
              category: category,
              correctAnswer: correctAnswer,
              userAnswer: choose,
            );
            didTheUserClick = true;
          },
          child: Container(
            padding: const EdgeInsetsDirectional.all(
              25,
            ),
            margin: const EdgeInsetsDirectional.symmetric(
              vertical: 10,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: isCorrect
                  ? Colors.greenAccent
                  : didTheUserClick
                      ? Colors.redAccent.shade100
                      : Colors.transparent,
              border: Border.all(
                color:
                    isCorrect ? AppColors.thirdColor : AppColors.primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadiusDirectional.circular(
                20,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    choose,
                    style: AppTextStyles.textStyle20Bold.copyWith(
                      color: isCorrect
                          ? AppColors.thirdColor
                          : AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
