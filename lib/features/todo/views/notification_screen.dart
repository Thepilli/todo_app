import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/height_spacer.dart';
import 'package:todo_app/core/common/widgets/reusable_text.dart';
import 'package:todo_app/core/common/widgets/width_spacer.dart';
import 'package:todo_app/core/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
  });
  // final String Payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Container(
                width: AppConst.jWidth,
                height: AppConst.jHeight,
                decoration: BoxDecoration(
                  color: AppColors.darkBackgroundContainer,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConst.jRadius),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: "Reminder",
                        style: appstyle(40, AppColors.textLightColor, FontWeight.bold),
                      ),
                      const HeightSpacer(height: 5),
                      Container(
                        width: AppConst.jWidth,
                        padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.all(
                            Radius.circular(9.h),
                          ),
                        ),
                        child: Row(
                          children: [
                            ReusableText(
                              text: "Today",
                              style: appstyle(14, AppColors.textDarkColor, FontWeight.bold),
                            ),
                            const WidthSpacer(width: 15),
                            ReusableText(
                              text: "From : start To : end",
                              style: appstyle(14, AppColors.textDarkColor, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ReusableText(
                        text: "Title",
                        style: appstyle(30, AppColors.textLightColor, FontWeight.bold),
                      ),
                      const HeightSpacer(height: 5),
                      ReusableText(
                        text: "DescriptioonsDescriptioons Descriptioons Descriptioons Descriptioons Descriptioons ",
                        style: appstyle(20, AppColors.textLightColor, FontWeight.bold),
                      ),
                      const HeightSpacer(height: 5),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: -30,
              child: Transform.rotate(
                angle: pi / 8,
                child: Image.asset(
                  'assets/images/cat_reminder.png',
                  height: 120,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
