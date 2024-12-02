import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/style/text_styles.dart';

class CreateUserDoneScreen extends StatelessWidget {
  const CreateUserDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hurray!',
          style: AppTextStyles.textStyle24Bold,
        ),
        Expanded(child: Lottie.asset(Assets.createUserDone)),
        const Text('Let\'s start!'),
      ],
    );
  }
}
