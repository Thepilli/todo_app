// ignore_for_file: prefer_const_constructors

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/custom_otn_button.dart';
import 'package:todo_app/core/common/widgets/custome_text_field.dart';
import 'package:todo_app/core/common/widgets/height_spacer.dart';
import 'package:todo_app/core/common/widgets/reusable_text.dart';
import 'package:todo_app/core/constants.dart';
import 'package:todo_app/core/strings/image_strings.dart';
import 'package:todo_app/features/authentication/views/otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phoneNumberController = TextEditingController();

  Country country = Country(
      phoneCode: '1',
      countryCode: "US",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "USA",
      example: "USA",
      displayName: "United States",
      displayNameNoCountryCode: "US",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset(ImageStrings.catLoging, width: 300),
            ),
            HeightSpacer(height: 20),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 16.w),
              child: ReusableText(
                  text: "Please Enter Your Phone Number", style: appstyle(17, AppColors.textLightColor, FontWeight.normal)),
            ),
            HeightSpacer(height: 20),
            CustomTextField(
              controller: phoneNumberController,
              hintText: "enter",
              hintStyle: appstyle(16, AppColors.textDarkColor, FontWeight.w600),
              isObscured: false,
              prefixIcon: Container(
                padding: EdgeInsets.all(14),
                child: GestureDetector(
                  child: ReusableText(
                    text: "${country.flagEmoji} + ${country.phoneCode}",
                    style: appstyle(18, AppColors.textDarkColor, FontWeight.bold),
                  ),
                  onTap: () {
                    showCountryPicker(
                      countryListTheme: CountryListThemeData(
                          backgroundColor: AppColors.darkBackground,
                          bottomSheetHeight: AppConst.jHeight * .6,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppConst.jRadius), topRight: Radius.circular(AppConst.jRadius))),
                      context: context,
                      onSelect: (code) {
                        setState(() {});
                      },
                    );
                  },
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            HeightSpacer(height: 20),
            CustomOtnButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpPage(),
                      ));
                },
                width: AppConst.jWidth * 0.6,
                height: AppConst.jHeight * 0.075,
                color: AppColors.darkBackground,
                color2: AppColors.light,
                text: 'Send Code')
          ],
        ),
      ),
    ));
  }
}
