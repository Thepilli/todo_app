import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhiteSpace extends StatelessWidget {
  const WhiteSpace({super.key, this.height, this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h, width: width?.h, // screenUtils extension for adaptive height
    );
  }
}
