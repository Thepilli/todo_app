import 'package:flutter/material.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isObscured,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboard,
    this.hintStyle,
  });

  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final bool isObscured;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboard;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: AppConst.jWidth * .9,
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: TextFormField(
          style: appstyle(18, AppColors.whiteColor, FontWeight.w700),
          keyboardType: keyboard,
          controller: controller,
          obscureText: isObscured,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: hintStyle,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            suffixIconColor: AppColors.blackColor,
            alignLabelWithHint: true,
            labelText: hintText,
            labelStyle: hintStyle,
            hintText: hintText,
            hintStyle: hintStyle,
            contentPadding: const EdgeInsets.all(27),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.light, width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.light, width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
