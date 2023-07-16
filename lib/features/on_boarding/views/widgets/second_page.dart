import 'package:flutter/material.dart';
import 'package:todo_app/core/common/widgets/elevated_button.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/core/strings/image_strings.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageStrings.todo),
        const WhiteSpace(height: 100),
        RoundButton(
          buttonText: 'Login with phone',
          onPressed: () {},
        ),
      ],
    );
  }
}
