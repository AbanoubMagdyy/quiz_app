import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/features/quiz/presentation/views/categories_screen.dart';
import '../../views/home_screen.dart';
part 'app_state.dart';

int numOfCorrectAnswer = 0;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
  ];

  int currentIndex = 0;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }

  int questionIndex = 1;
  void goToNextQuestion() {
    questionIndex = questionIndex + 1;
    emit(GoToNextQuestion());
  }

  int points = 0;
  void checkTheAnswer(
      {required String correctAnswer,
      required String category,
      required String userAnswer}) {
    if (correctAnswer == userAnswer) {
      points = points + 5;
      numOfCorrectAnswer = numOfCorrectAnswer + 1;
      mainBox.put(category, numOfCorrectAnswer);
    }
    emit(CheckTheAnswer());
  }

  void removeHistory() {
    questionIndex = 1;
    numOfCorrectAnswer = 0;
    emit(RemoveHistory());
  }
}
