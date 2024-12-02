import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/core/utils/style/paddings.dart';
import 'package:quiz_app/core/utils/widgets/custom_button.dart';
import '../../../../core/utils/style/colors.dart';
import '../../../../core/utils/style/text_styles.dart';
import '../../../quiz/presentation/views/app_layout.dart';
import '../view_model/create_user_cubit.dart';

class CreateUserLayout extends StatefulWidget {
  const CreateUserLayout({super.key});

  @override
  State<CreateUserLayout> createState() => _CreateUserLayoutState();
}

class _CreateUserLayoutState extends State<CreateUserLayout> {
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

  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.screenPadding,
          child: Column(
            children: [
              BlocBuilder<CreateUserCubit, CreateUserStates>(
                builder: (context, state) {
                  var cubit = CreateUserCubit.get(context);
                  return LinearPercentIndicator(
                    leading: Text(
                      '$pageIndex/${cubit.screens.length}',
                      style: AppTextStyles.textStyle18
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    percent: cubit.percent,
                    backgroundColor: AppColors.secondaryColor.withOpacity(.3),
                    progressColor: AppColors.secondaryColor,
                  );
                },
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsetsDirectional.all(15),
                  margin: const EdgeInsetsDirectional.symmetric(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadiusDirectional.circular(20),
                  ),
                  child: PageView(
                    onPageChanged: (index) {
                      pageIndex = index + 1;
                      CreateUserCubit.get(context).changePercent(index);
                    },
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: CreateUserCubit.get(context).screens,
                  ),
                ),
              ),
              CustomButton(
                () {
                  pageController.nextPage(
                      duration: const Duration(microseconds: 600),
                      curve: Curves.bounceIn);
                  if (pageIndex == 2) {
                    CreateUserCubit.get(context).saveUserData(userName);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppLayout(),
                      ),
                      (route) => false,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
