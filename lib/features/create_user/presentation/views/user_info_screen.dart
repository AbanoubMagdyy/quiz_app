import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/constants.dart';
import 'package:quiz_app/features/create_user/presentation/views/widgets/custom_text_field.dart';
import '../../../../core/utils/style/text_styles.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Let us know you more',
          style: AppTextStyles.textStyle24Bold,
        ),
        const Text('Enter your name'),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
            onFieldSubmitted: (value) {
              userName = value ?? 'User';
            },
            hintText: 'Name'),
      ],
    );
  }
}
