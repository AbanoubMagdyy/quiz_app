import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:quiz_app/features/quiz/presentation/views/widgets/quiz_app_bar_widget.dart';
import '../../../../core/utils/style/colors.dart';
import '../../../../core/utils/style/paddings.dart';
import '../view_model/app_cubit/app_cubit.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: AppCubit.get(context).currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          bottomNavigationBar: SnakeNavigationBar.color(
            currentIndex: cubit.currentIndex,
            onTap: (int index) {
              cubit.changeCurrentIndex(index);
              if (pageController.hasClients) {
                pageController.animateToPage(cubit.currentIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.ease);
              }
            },
            snakeViewColor: AppColors.secondaryColor,
            showSelectedLabels: true,
            backgroundColor: Colors.transparent,
            selectedLabelStyle:
                const TextStyle(fontSize: 12, color: Colors.red),
            unselectedItemColor: AppColors.secondaryColor,
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                ),
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                ),
                label: 'category',
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: AppPaddings.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const QuizAppBarWidget(),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: AppPaddings.screenPadding,
                      margin: const EdgeInsetsDirectional.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadiusDirectional.circular(20),
                      ),
                      child: PageView(
                        onPageChanged: (index) {
                          cubit.changeCurrentIndex(index);
                          if (pageController.hasClients) {
                            pageController.animateToPage(cubit.currentIndex,
                                duration: const Duration(milliseconds: 1),
                                curve: Curves.ease);
                          }
                        },
                        controller: pageController,
                        physics: const BouncingScrollPhysics(),
                        children: cubit.screens,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
