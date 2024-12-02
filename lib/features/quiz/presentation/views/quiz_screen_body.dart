import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_app/features/quiz/presentation/views/result_screen.dart';
import 'package:quiz_app/features/quiz/presentation/views/widgets/quiz_item_widget.dart';
import '../../../../core/utils/style/colors.dart';
import '../../../../core/utils/style/paddings.dart';
import '../../../../core/utils/style/text_styles.dart';
import '../../data/models/quiz_model.dart';
import '../view_model/app_cubit/app_cubit.dart';

class QuizScreenBody extends StatefulWidget {
  final List<QuizModel> questions;

  const QuizScreenBody(this.questions, {super.key});

  @override
  State<QuizScreenBody> createState() => _QuizScreenBodyState();
}

class _QuizScreenBodyState extends State<QuizScreenBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              var cubit = AppCubit.get(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearPercentIndicator(
                    barRadius: const Radius.circular(10),
                    animation: true,
                    lineHeight: 20.0,
                    backgroundColor: AppColors.secondaryColor.withOpacity(.3),
                    animationDuration: 800,
                    percent: cubit.questionIndex / widget.questions.length,
                    progressColor: AppColors.thirdColor,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8.0),
                    child: RichText(
                      text: TextSpan(
                        text: cubit.questionIndex.toString(),
                        style: AppTextStyles.textStyle24Bold
                            .copyWith(color: AppColors.thirdColor),
                        children: <TextSpan>[
                          TextSpan(
                            text: '/${widget.questions.length}',
                            style: AppTextStyles.textStyle18.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: AppPaddings.screenPadding,
              margin: const EdgeInsetsDirectional.symmetric(
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadiusDirectional.circular(20),
              ),
              child: PageView.builder(
                controller: pageController,
                itemCount: widget.questions.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    BlocListener<AppCubit, AppStates>(
                  listener: (context, state) async {
                    if (state is CheckTheAnswer) {
                      if (widget.questions.length - 1 == index) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResultScreen(),
                          ),
                          (route) => false,
                        );
                      } else {
                        await Future.delayed(const Duration(seconds: 2), () {
                          pageController.nextPage(
                              duration: const Duration(microseconds: 600),
                              curve: Curves.bounceIn);
                        });
                        AppCubit.get(context).goToNextQuestion();
                      }
                    }
                  },
                  child: QuizItemWidget(
                    widget.questions[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
