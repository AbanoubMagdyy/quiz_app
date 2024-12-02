import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/utils/assets.dart';
import 'package:quiz_app/core/utils/style/colors.dart';
import 'package:quiz_app/features/create_user/presentation/view_model/create_user_cubit.dart';
import 'package:quiz_app/features/create_user/presentation/views/create_user_layout.dart';
import 'package:quiz_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:quiz_app/features/on_boarding/presentation/views/widgets/on_boarding_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  final List<OnBoardingModel> onBoarding = [
    OnBoardingModel(
      mainColor: AppColors.primaryColor,
      secondColor: AppColors.secondaryColor,
      image: Assets.onboarding1,
      title: 'Test Your Knowledge!',
      body:
          "Challenge yourself with a variety of quizzes across different topics.\n Are you ready to become a quiz master?",
    ),
    OnBoardingModel(
      mainColor: AppColors.secondaryColor,
      secondColor: AppColors.primaryColor,
      image: Assets.onboarding2,
      title: "Learn and Grow!",
      body:
          "Every question is a step towards expanding your knowledge.\n Sharpen your mind with fun and engaging quizzes.",
    ),
    OnBoardingModel(
      mainColor: AppColors.primaryColor,
      secondColor: AppColors.secondaryColor,
      image: Assets.onboarding3,
      title: "Compete and Win!",
      body:
          "Track your progress, beat your high scores, and climb the leaderboard.\n Prove you're the ultimate quiz champion!",
    ),
  ];

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: ConcentricPageView(
        radius: 30,
        colors: onBoarding.map((e) => e.mainColor).toList(),
        itemCount: onBoarding.length,
        itemBuilder: (
          int index,
        ) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              OnBoardingWidget(onBoarding[index]),
              if (onBoarding.length - 1 == index)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    radius: 40,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                  create: (context) => CreateUserCubit(),
                                  child: const CreateUserLayout()),
                            ),
                            (route) => false,
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined)),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
