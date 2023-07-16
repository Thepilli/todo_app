import 'package:flutter/material.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/fading_text.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.buttonText, this.onPressed});

  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: AppColors.light,
          minimumSize: Size(size.width * .9, size.height * .06)),
      child: FadingText(
        text: buttonText,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: AppColors.blackColor,
      ),
    );
  }
}
