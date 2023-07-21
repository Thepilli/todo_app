import 'package:flutter/material.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isObscured,
      this.onChanged,
      this.suffixIcon,
      this.prefixIcon,
      this.keyboardType,
      this.hintStyle,
      this.isReadOnly = false});

  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final bool isObscured;
  final bool isReadOnly;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(color: AppColors.light, borderRadius: BorderRadius.all(Radius.circular(AppConst.jRadius))),
        child: TextFormField(
          readOnly: isReadOnly,
          keyboardType: keyboardType,
          controller: controller,
          cursorHeight: 25,
          onChanged: onChanged,
          obscureText: isObscured,
          obscuringCharacter: '*',
          style: appstyle(18, AppColors.textDarkColor, FontWeight.w700),
          decoration: InputDecoration(
            alignLabelWithHint: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            suffixIconColor: AppColors.darkBackground,
            hintStyle: hintStyle,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: .5),
              borderRadius: BorderRadius.zero,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkBackground, width: .5),
              borderRadius: BorderRadius.zero,
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey, width: .5),
              borderRadius: BorderRadius.zero,
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: .5),
              borderRadius: BorderRadius.zero,
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: .5),
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
      ),
    );
  }
}
