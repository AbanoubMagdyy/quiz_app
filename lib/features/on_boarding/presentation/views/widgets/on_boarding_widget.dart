import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/core/utils/style/text_styles.dart';
import 'package:quiz_app/features/on_boarding/data/models/on_boarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  const OnBoardingWidget(this.onBoardingModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: onBoardingModel.secondColor,
            borderRadius: const BorderRadiusDirectional.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          child: Lottie.asset(
            onBoardingModel.image,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.all(15.0),
          child: Column(
            children: [
              Text(
                onBoardingModel.title,
                style: AppTextStyles.textStyle20Bold.copyWith(
                  color: onBoardingModel.secondColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                onBoardingModel.body,
                style: AppTextStyles.textStyle18.copyWith(
                  color: onBoardingModel.secondColor.withOpacity(.8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
