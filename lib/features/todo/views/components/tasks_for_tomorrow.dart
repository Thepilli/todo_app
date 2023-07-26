import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/features/todo/app/task_provider.dart';
import 'package:todo_app/features/todo/utils/todo_utils.dart';
import 'package:todo_app/features/todo/views/add_or_edit_task_screen.dart';
import 'package:todo_app/features/todo/views/components/task_expansion_tile.dart';
import 'package:todo_app/features/todo/views/components/todo_tile.dart';

class TasksForTomorrow extends ConsumerWidget {
  const TasksForTomorrow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTasks = ref.watch(taskProvider);
    return FutureBuilder(
      future: TodoUtils.getTasksForTomorrow(allTasks),
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          debugPrint('Snapshot length: ${snapshot.data?.length}');
          final color = AppColors.randomColor();
          return TaskExpansionTile(
            color: color,
            title: "Tomorrow's Tasks",
            subtitle: "Tomorrow's Tasks are shown here",
            children: snapshot.data!.map(
              (task) {
                final isLast = snapshot.data!.indexWhere((element) => element.id == task.id) == snapshot.data!.length - 1;
                return ToDoTile(
                  bottomMargin: isLast ? null : 10,
                  task: task,
                  onDelete: () {
                    ref.watch(taskProvider.notifier).deleteTask(task.id!);
                  },
                  onEdit: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddOrEditTaskScreen(task),
                        ));
                  },
                  endIcon: SizedBox(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        task.isCompleted
                            ? const Text(
                                'Completed',
                                style: TextStyle(color: AppColors.completed),
                              )
                            : const Text(
                                'Mark as \ncompleted',
                                style: TextStyle(color: AppColors.notCompleted),
                              ),
                        const WhiteSpace(height: 8),
                        Transform.rotate(
                          angle: pi / 2,
                          child: Switch(
                            value: task.isCompleted,
                            onChanged: (value) {
                              task.isCompleted = !task.isCompleted;
                              ref.read(taskProvider.notifier).markAsCompleted(task);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
