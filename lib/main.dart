import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/core/utils/style/colors.dart';
import 'package:quiz_app/features/quiz/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:quiz_app/features/on_boarding/presentation/views/on_boarding_screen.dart';
import 'core/utils/bolc_observer.dart';
import 'core/utils/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  Bloc.observer = MyBlocObserver();
  userName = Shared.getDate('user') ?? '';
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await Hive.initFlutter();
  mainBox = await Hive.openBox('mainBox');

  runApp(const QuizMaster());
}

class QuizMaster extends StatelessWidget {
  const QuizMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.primaryColor,
        ),
        home: OnBoardingScreen(),
      ),
    );
  }
}
