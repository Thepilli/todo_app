import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/height_spacer.dart';
import 'package:todo_app/core/common/widgets/reusable_text.dart';
import 'package:todo_app/core/constants.dart';
import 'package:todo_app/core/strings/image_strings.dart';
import 'package:todo_app/features/todo/views/home_page.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            HeightSpacer(height: AppConst.jHeight * .12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset(
                ImageStrings.catLoging,
                width: AppConst.jWidth * .5,
              ),
            ),
            const HeightSpacer(height: 26),
            ReusableText(text: 'Enter the received code', style: appstyle(18, AppColors.light, FontWeight.bold)),
            const HeightSpacer(height: 26),
            Pinput(
              length: 6,
              showCursor: true,
              onCompleted: (value) {
                if (value.length == 6) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                }
              },
              onSubmitted: (value) {
                if (value.length == 6) {}
              },
            )
          ],
        ),
      )),
    );
  }
}
