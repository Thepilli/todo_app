import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FadingText extends StatelessWidget {
  const FadingText(
      {super.key,
      required this.text,
      required this.fontSize,
      this.fontWeight,
      required this.color,
      this.textAlign}); // whatever is in {} needs to be declared as a named parameter aka key:value
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.left,
      style: GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight ?? FontWeight.normal, color: color),
    );
  }
}
