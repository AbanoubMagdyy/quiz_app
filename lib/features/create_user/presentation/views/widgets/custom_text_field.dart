import 'package:flutter/material.dart';
import '../../../../../core/utils/style/colors.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String?)? onFieldSubmitted;
  final String hintText;
  const CustomTextField(
      {required this.onFieldSubmitted, required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
