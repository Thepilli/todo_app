import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/appstyle.dart';
import 'package:todo_app/core/common/widgets/custome_text_field.dart';
import 'package:todo_app/core/common/widgets/my_material_button.dart';
import 'package:todo_app/core/utils/core_utils.dart';
import 'package:todo_app/features/todo/app/task_date_provider.dart';

class AddTaskScreen extends HookConsumerWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final dateNotifier = ref.read(taskDateProvider.notifier);
    final startTimeNotifier = ref.read(taskStartTimeProvider.notifier);
    final endTimeNotifier = ref.read(taskEndTimeProvider.notifier);

    final dateProvider = ref.watch(taskDateProvider);
    final startProvider = ref.watch(taskStartTimeProvider);
    final endProvider = ref.watch(taskEndTimeProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(controller: titleController, hintText: 'Add Title', isObscured: false),
              CustomTextField(controller: descriptionController, hintText: 'Add Description', isObscured: false),
              MyMaterialButton(
                  buttonText: dateProvider == null ? 'Set Date' : dateNotifier.date()!,
                  onPressed: () {
                    DatePicker.showDatePicker(
                      context,
                      theme: DatePickerTheme(
                          doneStyle: appstyle(16, Colors.green, FontWeight.w500),
                          cancelStyle: appstyle(16, Colors.red, FontWeight.w500)),
                      minTime: DateTime.now(),
                      maxTime: DateTime(DateTime.now().year + 1),
                      onConfirm: (date) {
                        dateNotifier.changeDate(date);
                      },
                    );
                  },
                  isEnabled: true),
              Row(
                children: [
                  Expanded(
                      child: MyMaterialButton(
                          buttonText: startProvider == null ? 'Start Time' : startTimeNotifier.time()!,
                          onPressed: () {
                            if (dateProvider == null) {
                              CoreUtils.showSnackBar(context: context, message: 'Please Pick a Date First');
                              return;
                            }
                            DatePicker.showDateTimePicker(
                              context,
                              theme: DatePickerTheme(
                                  doneStyle: appstyle(16, Colors.green, FontWeight.w500),
                                  cancelStyle: appstyle(16, Colors.red, FontWeight.w500)),
                              minTime: DateTime.now(),
                              maxTime: DateTime(DateTime.now().year + 1),
                              onConfirm: (time) {
                                startTimeNotifier.changeTime(time);
                              },
                            );
                          },
                          isEnabled: true)),
                  Expanded(
                      child: MyMaterialButton(
                          buttonText: endProvider == null ? 'End Time' : endTimeNotifier.time()!,
                          onPressed: () {
                            if (dateProvider == null) {
                              CoreUtils.showSnackBar(context: context, message: 'Please Pick a Date First');
                              return;
                            }
                            if (startProvider == null) {
                              startTimeNotifier.changeTime(DateTime.now());
                            }
                            DatePicker.showDateTimePicker(
                              context,
                              theme: DatePickerTheme(
                                  doneStyle: appstyle(16, Colors.green, FontWeight.w500),
                                  cancelStyle: appstyle(16, Colors.red, FontWeight.w500)),
                              minTime: DateTime.now(),
                              maxTime: DateTime(DateTime.now().year + 1),
                              onConfirm: (time) {
                                endTimeNotifier.changeTime(time);
                              },
                            );
                          },
                          isEnabled: true)),
                ],
              ),
              MyMaterialButton(
                buttonText: 'Submit',
                onPressed: () {
                  if (titleController.text.trim().isNotEmpty &&
                      descriptionController.text.trim().isNotEmpty &&
                      dateProvider != null &&
                      startProvider != null &&
                      endProvider != null) {
                    final title = titleController.text.trim();
                    final description = descriptionController.text.trim();
                    final starTime = startProvider;
                    final endTime = endProvider;
                    debugPrint('title: $title');
                    debugPrint('description: $description');
                    debugPrint('starTime: $starTime');
                    debugPrint('endTime: $endTime');
                  } else {
                    CoreUtils.showSnackBar(context: context, message: 'You need to fill out all the fields first');
                    return;
                  }
                },
                isEnabled: true,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
