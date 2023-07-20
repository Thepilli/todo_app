// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:todo_app/core/colors.dart';

class DefText extends StatelessWidget {
  final String text;
  double? fontSize = 15;
  FontWeight? fontWeight = FontWeight.normal;
  Color? color = AppColors.textLightColor;
  DefText({Key? key, required this.text, this.fontSize, this.fontWeight, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
