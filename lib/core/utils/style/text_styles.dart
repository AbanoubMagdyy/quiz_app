import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/style/colors.dart';

abstract class AppTextStyles {
  static TextStyle textStyle20Bold = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryColor);
  static TextStyle textStyle24Bold = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryColor);
  static TextStyle textStyle18 = const TextStyle(
    fontSize: 18,
  );
}
