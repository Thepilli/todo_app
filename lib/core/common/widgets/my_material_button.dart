import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/colors.dart';

class MyMaterialButton extends StatelessWidget {
  const MyMaterialButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.isEnabled,
    this.color = AppColors.light,
  });
  final String buttonText;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MaterialButton(
        enableFeedback: true,
        disabledColor: AppColors.blackColor.withOpacity(.3),
        onPressed: isEnabled ? onPressed : null,
        color: color,
        textColor: AppColors.textDarkColor,
        height: 50,
        minWidth: double.maxFinite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text(
          buttonText,
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
