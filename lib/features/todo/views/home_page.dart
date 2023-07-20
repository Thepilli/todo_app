import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/custome_text_field.dart';
import 'package:todo_app/core/common/widgets/height_spacer.dart';
import 'package:todo_app/core/common/widgets/my_padding_w20.dart';
import 'package:todo_app/core/common/widgets/reusable_text.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController searchConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ReusableText(
                      text: 'Dashboard',
                      style: appstyle(18, AppColors.light, FontWeight.bold),
                    ),
                    IconButton(
                      splashColor: AppColors.light,
                      focusColor: AppColors.light,
                      highlightColor: AppColors.light,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.whiteColor,
                      ),
                    )
                  ],
                ),
              ),
              const HeightSpacer(height: 20),
              CustomTextField(
                controller: searchConroller,
                hintText: 'Search',
                isObscured: false,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      AntDesign.search1,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                suffixIcon: const Icon(
                  FontAwesome.sliders,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: MyPaddingW20(
        child: ListView(),
      )),
    );
  }
}
