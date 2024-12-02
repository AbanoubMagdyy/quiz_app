import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/core/utils/assets.dart';
import 'package:quiz_app/core/utils/style/colors.dart';
import 'package:quiz_app/core/utils/style/paddings.dart';
import 'package:quiz_app/core/utils/widgets/custom_button.dart';
import 'package:quiz_app/features/quiz/presentation/views/app_layout.dart';
import '../view_model/app_cubit/app_cubit.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.screenPadding,
          child: Column(
            children: [
              Expanded(child: Lottie.asset(Assets.onboarding3)),
              Text(
                'Congratulations'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryColor),
              ),
              Text(
                'Questions you got right'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 20, color: AppColors.secondaryColor),
              ),
              Text(
                '$numOfCorrectAnswer of 10'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.thirdColor),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(() {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppLayout(),
                  ),
                  (route) => false,
                );
                AppCubit.get(context).removeHistory();
              })
            ],
          ),
        ),
      ),
    );
  }
}
