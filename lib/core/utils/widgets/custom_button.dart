import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/text_styles.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomButton(this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 10,
          horizontal: 80,
        ),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadiusDirectional.circular(
            20,
          ),
        ),
        child: Text(
          'Continue',
          style: AppTextStyles.textStyle20Bold,
        ),
      ),
    );
  }
}
