import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/reusable_text.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/core/extensions/date_extensions.dart';
import 'package:todo_app/features/todo/models/task_model.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({
    super.key,
    required this.task,
    required this.onEdit,
    required this.onDelete,
    required this.endIcon,
    this.bottomMargin,
  });
  final TaskModel task;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final Widget endIcon;
  final double? bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: bottomMargin == null
          ? null
          : EdgeInsets.only(
              bottom: bottomMargin!.h,
            ),
      decoration: BoxDecoration(
        color: AppColors.blackColor.withOpacity(.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                height: 80.h,
                width: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.randomColor(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              const WhiteSpace(width: 15),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: task.title!,
                      style: appstyle(18, AppColors.whiteColor, FontWeight.bold),
                    ),
                    const WhiteSpace(height: 3),
                    ReusableText(
                      text: task.description!,
                      style: appstyle(15, AppColors.whiteColor, FontWeight.normal),
                    ),
                    const WhiteSpace(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 3.h,
                            horizontal: 15.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.darkBackground,
                            border: Border.all(
                              width: .3,
                              color: AppColors.greyBackground,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${task.startTime!.timeOnly} | ${task.endTime!.timeOnly}',
                              style: appstyle(12, AppColors.whiteColor, FontWeight.normal),
                            ),
                          ),
                        ),
                        const WhiteSpace(width: 20),
                        if (!task.isCompleted)
                          IconButton(
                              onPressed: onEdit,
                              icon: const Icon(
                                MaterialCommunityIcons.circle_edit_outline,
                                color: AppColors.whiteColor,
                              )),
                        const WhiteSpace(width: 20),
                        IconButton(
                            onPressed: onDelete,
                            icon: const Icon(
                              MaterialCommunityIcons.delete_circle,
                              color: AppColors.whiteColor,
                            )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          endIcon
        ],
      ),
    );
  }
}
