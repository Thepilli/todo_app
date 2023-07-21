// ignore_for_file: prefer_const_constructors

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
import 'package:todo_app/core/utils/core_utils.dart';
import 'package:todo_app/features/authentication/app/country_code_provider.dart';
import 'package:todo_app/features/authentication/controller/authentication_controller.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(countryCodeProvider);
    final phoneNumberController = useTextEditingController();

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
              hintText: "",
              hintStyle: appstyle(16, AppColors.textDarkColor, FontWeight.w600),
              isObscured: false,
              isReadOnly: code == null,
              prefixIcon: Container(
                padding: EdgeInsets.all(14),
                child: GestureDetector(
                  child: ReusableText(
                    text: code == null ? 'Pick your country' : '${code.flagEmoji} + ${code.phoneCode}',
                    style: appstyle(code == null ? 13 : 18, AppColors.textDarkColor, FontWeight.bold),
                  ),
                  onTap: () {
                    showCountryPicker(
                      countryListTheme: CountryListThemeData(
                          inputDecoration: InputDecoration(
                              labelText: "Search your country",
                              hintText: "Search your country",
                              hintStyle: appstyle(15, AppColors.textLightColor, FontWeight.normal)),
                          textStyle: appstyle(15, AppColors.textLightColor, FontWeight.normal),
                          backgroundColor: AppColors.darkBackground,
                          bottomSheetHeight: AppConst.jHeight * .6,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppConst.jRadius), topRight: Radius.circular(AppConst.jRadius))),
                      context: context,
                      onSelect: (code) {
                        ref.read(countryCodeProvider.notifier).changeCountry(code);
                      },
                    );
                  },
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            HeightSpacer(height: 20),
            CustomOtnButton(
                onTap: () async {
                  if (code == null) return;
                  debugPrint('+${code.phoneCode}${phoneNumberController.text}');
                  final navigator = Navigator.of(context);
                  CoreUtils.showLoader(context);
                  await ref.read(authControllerProvider).sendOTP(
                        context: context,
                        phoneNumber: '+${code.phoneCode}${phoneNumberController.text}',
                      );
                  navigator.pop();
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
