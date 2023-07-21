import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/height_spacer.dart';
import 'package:todo_app/core/common/widgets/reusable_text.dart';
import 'package:todo_app/core/constants.dart';
import 'package:todo_app/core/strings/image_strings.dart';
import 'package:todo_app/features/authentication/controller/authentication_controller.dart';

class OTPVerificationScreen extends ConsumerWidget {
  const OTPVerificationScreen({super.key, required this.verificationId});

  final String verificationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onCompleted: (value) async {
                if (value.length == 6) {
                  await ref.read(authControllerProvider).verifyOTP(context: context, verificationId: verificationId, otp: value);
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
