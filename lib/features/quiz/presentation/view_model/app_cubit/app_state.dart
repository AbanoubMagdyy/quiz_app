part of 'app_cubit.dart';

abstract class AppStates {}

class AppInitial extends AppStates {}

class ChangeCurrentIndex extends AppStates {}

class CheckTheAnswer extends AppStates {}

class RemoveHistory extends AppStates {}

class GoToNextQuestion extends AppStates {}
