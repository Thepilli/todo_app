import 'package:flutter/material.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/fading_text.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/core/strings/image_strings.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageStrings.todo),
        const WhiteSpace(height: 100),
        const FadingText(
          text: 'ToDo with Riverpod',
          fontSize: 30,
          color: AppColors.light,
          textAlign: TextAlign.center,
        ),
        const WhiteSpace(height: 10),
        const FadingText(
          text: 'Welcome! Are you struggling with your day schedule and motivation',
          fontSize: 17,
          color: AppColors.grey,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
