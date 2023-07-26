import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/custome_text_field.dart';
import 'package:todo_app/core/common/widgets/height_spacer.dart';
import 'package:todo_app/core/common/widgets/my_padding_w20.dart';
import 'package:todo_app/core/common/widgets/reusable_text.dart';
import 'package:todo_app/core/constants.dart';
import 'package:todo_app/core/helper/db_helper.dart';
import 'package:todo_app/features/authentication/views/login_screen.dart';
import 'package:todo_app/features/todo/app/task_provider.dart';
import 'package:todo_app/features/todo/views/add_task_screen.dart';
import 'package:todo_app/features/todo/views/components/active_tasks.dart';
import 'package:todo_app/features/todo/views/components/completed_tasks.dart';
import 'package:todo_app/features/todo/views/components/tasks_for_next_week.dart';
import 'package:todo_app/features/todo/views/components/tasks_for_tomorrow.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchConroller = useTextEditingController();
    final tabController = useTabController(initialLength: 2);
    var size = MediaQuery.of(context).size;
    ref.read(taskProvider.notifier).refresh();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: pi,
                      child: IconButton(
                          onPressed: () async {
                            final navigator = Navigator.of(context);
                            await DBHelper.deleteUser();
                            navigator.pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                                (route) => false);
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: AppColors.whiteColor,
                          )),
                    ),
                    ReusableText(
                      text: 'Task Managemetn',
                      style: appstyle(18, AppColors.light, FontWeight.bold),
                    ),
                    IconButton.filled(
                      splashColor: AppColors.light,
                      focusColor: AppColors.light,
                      highlightColor: AppColors.light,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddTaskScreen(),
                            ));
                      },
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
        child: ListView(
          shrinkWrap: true,
          children: [
            const HeightSpacer(height: 40),
            Row(
              children: [
                const Icon(
                  Icons.tune,
                  color: AppColors.light,
                ),
                ReusableText(text: 'Today Tasks:', style: appstyle(20, AppColors.whiteColor, FontWeight.bold)),
              ],
            ),
            const HeightSpacer(height: 20),
            DecoratedBox(
              decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.all(Radius.circular(AppConst.jRadius))),
              child: TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator:
                    BoxDecoration(color: AppColors.light, borderRadius: BorderRadius.all(Radius.circular(AppConst.jRadius))),
                tabs: [
                  Tab(child: ReusableText(text: "Pending", style: appstyle(20, AppColors.textDarkColor, FontWeight.bold))),
                  Tab(child: ReusableText(text: "Completed", style: appstyle(20, AppColors.textDarkColor, FontWeight.bold))),
                ],
              ),
            ),
            const HeightSpacer(height: 20),
            SizedBox(
              height: size.height * .25,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    ActiveTasks(),
                    CompletedTasks(),
                  ],
                ),
              ),
            ),
            const HeightSpacer(height: 20),
            const TasksForTomorrow(),
            const HeightSpacer(height: 20),
            const TasksForNextWeek()
          ],
        ),
      )),
    );
  }
}
